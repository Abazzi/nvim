return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  init = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>tc', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>ts', builtin.git_status, {})
  end,
}
