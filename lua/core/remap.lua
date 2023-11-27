vim.g.mapleader = " "
local keybind = vim.keymap.set

-- Copy and Paste to clipboard keymaps
keybind("n", "<leader>y", '"+y')
keybind("v", "<leader>y", '"+y')
keybind("n", "<leader>yy", '"+yy')
keybind("n", "<leader>Y", '"+Y')
keybind("n", "<leader>rw", vim.cmd.Ex)

-- Open Parent Directory in Oil
keybind("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Move Selected lines up and down
keybind("v", "J", [[:move '>+1<CR>gv=gv]], { silent = true })
keybind("v", "K", [[:move '<-2<CR>gv=gv]], { silent = true })
keybind({ "n" }, "<Leader>k", function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- Telescope  keybinds
keybind("n", "<leader>fg", function()
  require("telescope.builtin").git_files({ hidden = true })
end, { desc = "Find Git File" })
keybind("n", "<leader>ff", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Find Files" })
keybind("n", "<leader>fw", function()
  require("telescope.builtin").grep_string()
end, { desc = "Find Git File" })
keybind("n", "<leader>gc", function()
  require("telescope.builtin").git_commits()
end, { desc = "Telescope: View Git Commits" })
keybind("n", "<leader>fg", function()
  require("telescope.builtin").git_files()
end, { desc = "Find Git File" })
keybind("n", "<leader>fs", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live Grep" })
keybind("n", "<leader>fr", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Open Recent File" })
keybind("n", "<leader>fm", function()
  require("telescope.builtin").marks()
end, { desc = "Show Marks" })
keybind("n", "<leader>fb", function()
  require('telescope.builtin').buffers()
end, { desc = "Find Buffer" })

-- Other file related keybinds
keybind("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Fugitive Keybinds
keybind("n", "<leader>gh", "<cmd>G<cr>", { desc = "Fugitive: Open Horizontal" })
keybind("n", "<leader>gv", "<cmd>vertical G<cr>", { desc = "Fugitive: Open Vertical" })

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

-- Harpoon Keybinds
keybind("n", "<leader>hm",
  "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>"
  , { desc = "Open Menu" }
)

keybind("n", "<leader>ha",
  "<cmd>lua require('harpoon.mark').add_file()<cr>"
  , { desc = "Add File" }
)

keybind("n", "<leader>hr",
  "<cmd>lua require('harpoon.mark').remove_file()<cr>"
  , { desc = "Remove File" }
)

keybind("n", "<leader>hn",
  "<cmd>lua require('harpoon.ui').nav_next()<cr>"
  , { desc = "Next File" }
)

keybind("n", "<leader>hp",
  "<cmd>lua require('harpoon.ui').nav_prev()<cr>"
  , { desc = "Previous File" }
)

keybind("n", "<leader>h1",
  "<cmd>lua require('harpoon.ui').nav_file(1)<cr>"
  , { desc = "Go To File 1" }
)

keybind("n", "<leader>h2",
  "<cmd>lua require('harpoon.ui').nav_file(2)<cr>"
  , { desc = "Go To File 2" }
)

keybind("n", "<leader>h3",
  "<cmd>lua require('harpoon.ui').nav_file(3)<cr>"
  , { desc = "Go To File 3" }
)

keybind("n", "<leader>co", function()
  require('code_action_menu').open_code_action_menu()
end, { desc = "Code Action Menu" })
