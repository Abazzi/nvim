vim.g.mapleader = " "
-- Remap for Escape key
vim.keymap.set("i", "jj", "<Esc>")

-- Copy and Paste to clipboard keymaps
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- Open Parent Directory in Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Move Selected lines up and down
vim.keymap.set("v", "J", [[:move '>+1<CR>gv=gv]], { silent = true })
vim.keymap.set("v", "K", [[:move '<-2<CR>gv=gv]], { silent = true })
vim.keymap.set({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })
