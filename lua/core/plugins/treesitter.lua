return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "typescript",
          "json",
          "javascript",
          "html",
          "scss",
          "tsx",
          "jsonc",
        },
        sync_install = true,
        auto_install = true,
        ignore_install = {},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
