return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim",       tag = "legacy", opts = {} },
    "folke/neodev.nvim",
  },
  config = function()
    -- Use default capabilities, no nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then desc = "LSP: " .. desc end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
      nmap("<C-k>", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
      nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
      nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "[W]orkspace [L]ist Folders")

      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    local servers = {
      eslint = { filetypes = { "ts", "tsx", "js", "jsx", "json" } },
      html = { filetypes = { "html", "twig", "hbs" } },
      cssls = { filetypes = { "css", "sass", "scss" } },
      svelte = { filetypes = { "svelte" } },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Set up Neodev before lua_ls
    require("neodev").setup()

    -- Ensure servers are installed via mason
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    -- Floating border styling for hover/signatureHelp windows
    local border = "rounded"
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    -- Manually configure each server
    local lspconfig = require("lspconfig")
    for name, config in pairs(servers) do
      lspconfig[name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        settings = config,
        filetypes = config.filetypes, -- needed if overriding default filetypes
      })
    end
  end,
}
