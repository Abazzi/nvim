return {
	"mvllow/modes.nvim",
	tag = "v0.2.0",
	config = function()
		require("modes").setup({
			colors = {
				copy = "#f5c359",
				delete = "#c75c6a",
				insert = "#78ccc5",
				visual = "#ef9f76",
			},
		})
	end,
}
