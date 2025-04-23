vim.g.mapleader = " "
vim.g.localleader = ","

-- Copy and Paste to clipboard keymaps
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- Move lines of text up and down
-- Normal Mode
vim.keymap.set("n", "<C-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-Up>", ":m .-2<CR>==")
-- Insert Mode
vim.keymap.set("i", "<C-Down>", "<esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<C-Up>", "<esc>:m .-2<CR>==gi")
-- Visual Mode
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")

-- search within visual selection - this is magic
vim.keymap.set("x", "/", "<Esc>/\\%V")

-- Duplicate line and comment the first line. I use it all the time while coding.
vim.keymap.set("n", "ycc", "yygccp", { remap = true })

-- Other file related keymaps
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

--Help/Debug/Conceal keymaps
vim.keymap.set("n", "<leader>Hch", ":set conceallevel=1<cr>", { desc = "hide/conceal" })
vim.keymap.set("n", "<leader>Hcs", ":set conceallevel=0<cr>", { desc = "show/unconceal" })

--Splitting Keymaps
vim.keymap.set("n", "<leader>sv", "<cmd>:vs<cr>", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>:sp<cr>", { desc = "Split Window Horizontally" })

-- Change Inside Word Keybind
vim.keymap.set("n", "<C-c>", "ciw")
