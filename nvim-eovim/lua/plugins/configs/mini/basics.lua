local basics = require('mini.basics')
basics.setup({
  options = {
    basic = true,
    extra_ui = false,
    win_borders = 'bold',
  },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\]],
    windows = true,
    move_with_alt = true,
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = true,
  },
  silent = false,
})
