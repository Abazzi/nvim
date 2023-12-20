return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	opts = {
		file_ignore_patterns = { "node_modules", ".git" },
	},
}
