return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        -- Use a sub-list to run only the first available formatter
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        html = { "prettierd" },
        scss = { "prettierd" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
