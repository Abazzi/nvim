return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = "everforest",
      padding = 1,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
  },
}
