return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	theme = "hyper",
	config = function()
		require("dashboard").setup({
			-- config
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
