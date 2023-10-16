return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				f = {
					name = "+file",
				},
				h = {
					name = "harpoon",
				},
				g = {
					name = "+git",
				},
				H = {
					name = "help/debug/conceal",
					c = {
						name = "conceal",
					},
				},
				t = {
					name = "+treesitter",
				},
				d = {
					name = "DAP",
				},
				x = {
					name = "+trouble",
				},
			},
		}, opts)
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
