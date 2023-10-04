return {
  'echasnovski/mini.basics',
  version = '*',
  config = function()
    require('mini.basics').setup({
      mappings = {
        basic = true,
        option_toggle_prefix = [[\]],
        windows = true,
        move_with_alt = true,
      }
    })
  end
}
