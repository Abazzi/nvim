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
					g = { "<cmd>Telescope git_files<cr>", "Find Git File" },
					f = { "<cmd>Telescope find_files<cr>", "Find File" },
					s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
					r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
					n = { "<cmd>enew<cr>", "New File" },
				},
				h = {
					name = "harpoon",
					a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
					r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "remove file" },
					m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "harpoon menu" },
					n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next file" },
					p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous file" },
					["1"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
					["2"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
					["3"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
					["4"] = { "<cmd> lua require('harpoon.ui').nav_file(4)<cr>", "file 4" },
				},
				g = {
					name = "+git",
					h = { "<cmd>G<cr>", "open fugitive in horizonal window split" },
					v = { "<cmd>vertical G<cr>", "open fugitive in vertical window split" },
					l = { "<cmd>Git log --oneline<cr>", "git log one line" },
				},
				e = { "<cmd> lua vim.diagnostic.open_float(0,{scope='line'})<cr>", "show error" },
				H = {
					name = "help/debug/conceal",
					c = {
						name = "conceal",
						h = { ":set conceallevel=1<cr>", "hide/conceal" },
						s = { ":set conceallevel=0<cr>", "show/unconceal" },
					},
					t = {
						name = "treesitter",
						t = { vim.treesitter.inspect_tree, "show tree" },
						c = { ":=vim.treesitter.get_captures_at_cursor()<cr>", "show capture" },
						n = { ":=vim.treesitter.get_node():type()<cr>", "show node" },
					},
				},
				db = { "<cmd>DapToggleBreakpoint<cr>", "Debugger: Add Breakpoint at line" },
				dr = { "<cmd> DapContinue<cr>", "Run or continue the debugger" },
			},
		}, opts)
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
