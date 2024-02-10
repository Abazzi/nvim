return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		{
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-neotest/neotest-jest",
			},
			config = function()
				require("neotest").setup({
					adapters = {
						require("neotest-jest")({
							jestCommand = "npm test --",
							jestConfigFile = "custom.jest.config.ts",
							env = { CI = true },
							cwd = function(path)
								return vim.fn.getcwd()
							end,
						}),
					},
				})
			end,
		},
	},
  -- Run Tests
  vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" }),
  vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test File" }),
  vim.keymap.set(
    "n",
    "<leader>td",
    "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
    { desc = "Run Current Test Directory" }
  ),
  vim.keymap.set("n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle Test Output Panel" }),
  vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" }),
  vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })
}
