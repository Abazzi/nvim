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
					"vim",
					"vimdoc",
					"jsdoc",
					"typescript",
					"json",
					"javascript",
					"html",
					"scss",
					"tsx",
					"jsonc",
					"markdown",
					"markdown_inline",
				},
				sync_install = true,
				auto_install = true,
				ignore_install = {},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Leader>ss",
						node_incremental = "<Leader>si",
						scope_incremental = "<Leader>sc",
						node_decremental = "<Leader>sd",
					},
				},
				require("nvim-treesitter.configs").setup({
					textobjects = {
						select = {
							enable = true,

							-- Automatically jump forward to textobj, similar to targets.vim
							lookahead = true,

							keymaps = {
								-- You can use the capture groups defined in textobjects.scm
								["af"] = "@function.outer",
								["if"] = "@function.inner",
								["ac"] = "@class.outer",
								-- You can optionally set descriptions to the mappings (used in the desc parameter of
								-- nvim_buf_set_keymap) which plugins like which-key display
								["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
								-- You can also use captures from other query groups like `locals.scm`
								["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							},
							-- You can choose the select mode (default is charwise 'v')
							--
							-- Can also be a function which gets passed a table with the keys
							-- * query_string: eg '@function.inner'
							-- * method: eg 'v' or 'o'
							-- and should return the mode ('v', 'V', or '<c-v>') or a table
							-- mapping query_strings to modes.
							selection_modes = {
								["@parameter.outer"] = "v", -- charwise
								["@function.outer"] = "V", -- linewise
								["@class.outer"] = "<c-v>", -- blockwise
							},
							-- If you set this to `true` (default is `false`) then any textobject is
							-- extended to include preceding or succeeding whitespace. Succeeding
							-- whitespace has priority in order to act similarly to eg the built-in
							-- `ap`.
							--
							-- Can also be a function which gets passed a table with the keys
							-- * query_string: eg '@function.inner'
							-- * selection_mode: eg 'v'
							-- and should return true of false
							include_surrounding_whitespace = true,
						},
					},
				}),
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		-- Treesitter Keybinds
		vim.keymap.set("n", "<leader>tt", vim.treesitter.inspect_tree, { desc = "show tree" }),
		vim.keymap.set("n", "<leader>tc", ":=vim.treesitter.get_captures_at_cursor()<cr>", { desc = "show capture" }),
		vim.keymap.set("n", "<leader>tn", ":=vim.treesitter.get_node()<cr>", { desc = "show node" }),
	},
}
