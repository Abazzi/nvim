return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "svelte",
        "json",
        "html",
        "css",
        "bash",
        "markdown",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
