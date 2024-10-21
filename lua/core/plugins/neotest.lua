return {
	"nvim-neotest/neotest",
	dependencies = {
		"marilari88/neotest-vitest",
		"fredrikaverpil/neotest-golang",
		"nvim-neotest/neotest-jest",
	},
	opts = {
		adapters = {
			["neotest-vitest"] = {},
			["neotest-golang"] = {
				-- FIX: doesn't work when in subdirectory of repo (ex: "sesh/v2/namer")
				args = { "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
			},
			["neotest-jest"] = {
				jestCommand = "npm test --",
				env = { CI = true },
			},
		},
	},
	vim.keymap.set("n", "tta", "<cmd>lua require('neotest').run.attach()<cr>", { desc = "Attach to nearest test" }),
	vim.keymap.set("n", "ttl", "<cmd>lua require('neotest').run.run_last()<cr>", { desc = "Attach to last test" }),
	vim.keymap.set(
		"n",
		"tto",
		"<cmd>lua require('neotest').output_panel.toggle()<cr>",
		{ desc = "Toggle Test Output Panel" }
	),
	vim.keymap.set("n", "ttp", "<cmd>lua require('neotest').run.stop()<cr>", { desc = "Stop the nearest test" }),
	vim.keymap.set("n", "tts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Toggle Test Summary" }),
	vim.keymap.set("n", "tta", "<cmd>lua require('neotest').run.attach()<cr>", { desc = "Attach to nearest test" }),
	vim.keymap.set(
		"n",
		"ttT",
		"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
		{ desc = "Test Current File" }
	),
	vim.keymap.set("n", "ttt", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run the nearest test" }),
	vim.keymap.set(
		"n",
		"ttD",
		"<cmd>lua require('neotest').run.run({suite = false, strategy = 'dap'})<cr>",
		{ desc = "Debug Nearest Test" }
	),
}
