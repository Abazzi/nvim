vim.api.nvim_create_user_command('Sandr', function(opts)
  local template = ':%s/'
  local cmd = string.format("%s/%s/gc", opts.fargs[1], opts.fargs[2])
  local returnValue = string.format('%s%s', template, cmd)
  vim.cmd(returnValue)
end, { desc = "Search and Replace", nargs = '*' })
