return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		local cp = require("catppuccin")
		cp.setup()
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
