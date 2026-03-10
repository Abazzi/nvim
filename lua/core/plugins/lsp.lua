return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      { "mason-org/mason.nvim", opts = {} },

      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "lua_ls",
            "ts_ls",
            "pyright",
            "clangd",
          },
        },
      },

      { "j-hui/fidget.nvim", opts = {} },

      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            "lazy.nvim",
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

config = function()
  local capabilities = require("blink.cmp").get_lsp_capabilities()

  -- default config for all servers
  vim.lsp.config("*", {
    capabilities = capabilities,
  })

  -- lua specific config
  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        completion = { callSnippet = "Replace" },
        telemetry = { enable = false },
      },
    },
  })

  -- LSP keymaps
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
      local map = function(keys, func)
        vim.keymap.set("n", keys, func, { buffer = ev.buf })
      end

      map("gd", vim.lsp.buf.definition)
      map("gD", vim.lsp.buf.declaration)
      map("gr", vim.lsp.buf.references)
      map("gi", vim.lsp.buf.implementation)
      map("K", vim.lsp.buf.hover)
      map("<leader>rn", vim.lsp.buf.rename)
      map("<leader>ca", vim.lsp.buf.code_action)
      map("<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end)
    end,
  })

  -- enable all mason-installed servers
  local registry = require("mason-registry")

  for _, package in ipairs(registry.get_installed_packages()) do
    local name = package.name
    pcall(vim.lsp.enable, name)
  end
end  },
}
