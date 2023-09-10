# Neovim Configuration


## Installation

Version of Neovim built on: 0.9.0
```
    $ git clone https://github.com/Abazzi/nvim.git ~/.config/   
```

## Config Structure Tree
```.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    └── core
        ├── init.lua
        ├── plugins
        │   ├── autocompletion.lua
        │   ├── autoformat.lua
        │   ├── colorscheme.lua
        │   ├── comments.lua
        │   ├── fugitive.lua
        │   ├── harpoon.lua
        │   ├── lsp.lua
        │   ├── lualine.lua
        │   ├── mini-ai.lua
        │   ├── mini-basics.lua
        │   ├── mini-indentscope.lua
        │   ├── mini-pairs.lua
        │   ├── nvim-dap-ui.lua
        │   ├── nvim-dap.lua
        │   ├── telescope.lua
        │   ├── treesitter.lua
        │   ├── webdevicons.lua
        │   └── whichkey.lua
        ├── remap.lua
        └── set.lua
 
```
## Plugins
- Lazy.nvim
- Mason.nvim
- Harpoon
- Telescope
- Treesitter
- Mini Modules (ai, basics, indentscope, pairs)
- nvim-dap/nvim-dap
- lunaline
- webdevicons
- whichkey
- fugitive
- comments.nvim
- catppuccin mocha
