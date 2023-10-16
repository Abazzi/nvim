vim.g.mapleader = " "
local keybind = vim.keymap.set

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

-- Telescope  keybinds
keybind("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find Git File" })
keybind("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
keybind("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
keybind("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Open Recent File" })
keybind("n", "<leader>fn", "<cmd>Telescope git_files<cr>", { desc = "Find Git File" })

-- Other file related keybinds
keybind("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Harpoon Keybinds
keybind("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add File" })
keybind("n", "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", { desc = "Remove File" })
keybind("n", "<leader>hm", "<cmd>lua require('harpoon.mark').toggle_quick_menu()<cr>", { desc = "Harpoon Menu" })
keybind("n", "<leader>hp", "<cmd>lua require('harpoon.mark').nav_prev()<cr>", { desc = "Previous File" })
keybind("n", "<leader>ha", "<cmd>lua require('harpoon.mark').nav_next()<cr>", { desc = "Next File" })
keybind("n", "<leader>h1", "<cmd>lua require('harpoon.mark').nav_file(1)<cr>", { desc = "File 1" })
keybind("n", "<leader>h2", "<cmd>lua require('harpoon.mark').nav_file(2)<cr>", { desc = "File 2" })
keybind("n", "<leader>h3", "<cmd>lua require('harpoon.mark').nav_file(3)<cr>", { desc = "File 3" })
keybind("n", "<leader>h4", "<cmd>lua require('harpoon.mark').nav_file(4)<cr>", { desc = "File 4" })

-- Fugitive Keybinds
keybind("n", "<leader>gh", "<cmd>G<cr>", { desc = "Open in Horizontal Window Split" })
keybind("n", "<leader>gv", "<cmd>vertical G<cr>", { desc = "Open in Vertical Window Split" })
keybind("n", "<leader>gl", "<cmd>Git log --oneline<cr>", { desc = "Git Log" })

--Help/Debug/Conceal Keybinds
keybind("n", "<leader>Hch", ":set conceallevel=1<cr>", { desc = "hide/conceal" })
keybind("n", "<leader>Hcs", ":set conceallevel=0<cr>", { desc = "show/unconceal" })

-- Treesitter Keybinds
keybind("n", "<leader>tt", vim.treesitter.inspect_tree, { desc = "show tree" })
keybind("n", "<leader>tc", ":=vim.treesitter.get_captures_at_cursor()<cr>", { desc = "show capture" })
keybind("n", "<leader>tn", ":=vim.treesitter.get_node()<cr>", { desc = "show node" })

-- DAP keybinds
keybind("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Debugger: Add Breakpoint at line" })
keybind("n", "<leader>db", "<cmd>DapContinue<cr>", { desc = "Run or continue the debugger" })

-- Trouble Keybinds
keybind("n", "<leader>xx", function()
	require("trouble").open()
end, { desc = "Open Trouble" })

keybind("n", "<leader>xw", function()
	require("trouble").open("workspace_diagnostics")
end, { desc = "Workspace Diagnostics" })

keybind("n", "<leader>xd", function()
	require("trouble").open("document_diagnostics")
end, { desc = "Document Diagnostics" })

keybind("n", "<leader>xq", function()
	require("trouble").open("quickfix")
end, { desc = "Quickfix Menu" })

keybind("n", "<leader>xR", function()
	require("trouble").open("lsp_references")
end, { desc = "LSP References" })

keybind("n", "<leader>xn", function()
	require("trouble").next({ skip_groups = true, jump = true })
end, { desc = "Next Item" })

keybind("n", "<leader>xp", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end, { desc = "Previous Item" })
