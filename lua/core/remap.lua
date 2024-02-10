vim.g.mapleader = " "
local keybind = vim.keymap.set

-- Copy and Paste to clipboard keymaps
keybind("n", "<leader>y", '"+y')
keybind("v", "<leader>y", '"+y')
keybind("n", "<leader>yy", '"+yy')
keybind("n", "<leader>Y", '"+Y')
keybind("n", "<leader>rw", vim.cmd.Ex)

-- Paste without overwriting register
keybind("v", "p", '"_dP')

-- Move Selected lines up and down
keybind("v", "J", [[:move '>+1<CR>gv=gv]], { silent = true })
keybind("v", "K", [[:move '<-2<CR>gv=gv]], { silent = true })
keybind({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- Other file related keybinds
keybind("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
keybind({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

--Help/Debug/Conceal Keybinds
keybind("n", "<leader>Hch", ":set conceallevel=1<cr>", { desc = "hide/conceal" })
keybind("n", "<leader>Hcs", ":set conceallevel=0<cr>", { desc = "show/unconceal" })
