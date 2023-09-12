vim.g.mapleader = " "
vim.keymap.set('i', "<C-l>", "<Esc>")
vim.keymap.set('n', "<leader>rw", vim.cmd.Ex)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
