return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    --
    -- Trouble Keybinds
    vim.keymap.set("n", "<leader>xx", function()
      require("trouble").open()
    end, { desc = "Open Trouble" }),

    vim.keymap.set("n", "<leader>xw", function()
      require("trouble").open("workspace_diagnostics")
    end, { desc = "Workspace Diagnostics" }),

    vim.keymap.set("n", "<leader>xd", function()
      require("trouble").open("document_diagnostics")
    end, { desc = "Document Diagnostics" }),

    vim.keymap.set("n", "<leader>xq", function()
      require("trouble").open("quickfix")
    end, { desc = "Quickfix Menu" }),

    vim.keymap.set("n", "<leader>xR", function()
      require("trouble").open("lsp_references")
    end, { desc = "LSP References" }),

    vim.keymap.set("n", "<leader>xn", function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, { desc = "Next Item" }),

    vim.keymap.set("n", "<leader>xp", function()
      require("trouble").previous({ skip_groups = true, jump = true })
    end, { desc = "Previous Item" })

  },
}
