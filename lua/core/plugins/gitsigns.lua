return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>gH", gs.stage_hunk, { desc = "GitSigns state hunk" })
				map("n", "<leader>gR", gs.reset_hunk, { desc = "GitSigns reset hunk" })
				map("v", "<leader>gH", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "GitSigns stage_hunk" })
				map("v", "<leader>rh", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "GitSigns reset_hunk" })
				map("n", "<leader>uh", gs.undo_stage_hunk, { desc = "GitSigns undo_stage_hunk" })
				map("n", "<leader>sb", gs.stage_buffer, { desc = "GitSigns stage_buffer" })
				map("n", "<leader>rb", gs.reset_buffer, { desc = "GitSigns reset_buffer" })
				map("n", "<leader>ph", gs.preview_hunk, { desc = "GitSigns preview_hunk" })
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, { desc = "GitSigns blame line" })
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "GitSigns toggle blame" })
				map("n", "<leader>gd", gs.diffthis, { desc = "GitSigns diffthis" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "GitSigns diffthis" })
				map("n", "<leader>htd", gs.toggle_deleted, { desc = "GitSigns toggle_deleted" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns select hunk" })
			end,
		})
	end,
}
