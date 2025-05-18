local getIcons = require("core.icons").get_icons
local clue = require("mini.clue")
local _desc = function (mode, icon, pattern, discription)
  mode = mode or "n"
  pattern = pattern or ''
  -- local icon = getIcons "finder"
  local count = function ()
    local keymaps = vim.api.nvim_get_keymap(mode)
    local f_keymaps = vim.iter(keymaps):filter(function (item)
      return item.lhs:match(pattern)
    end):totable()
    return vim.tbl_count(f_keymaps)
  end
  local desc = string.format("+%d %s %s", count(), getIcons(icon), discription) -- +(count) A discription
  return desc
end

local count = function (mode, pattern)
  local keymaps = vim.api.nvim_get_keymap(mode)
  local f_keymaps = vim.iter(keymaps):filter(function (item)
    return item.lhs:match(pattern)
  end):totable()
  return vim.tbl_count(f_keymaps)
end


local options = {
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- -- Built-in completion
    -- { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- -- Marks
    -- { mode = 'n', keys = "'" },
    -- { mode = 'n', keys = '`' },
    -- { mode = 'x', keys = "'" },
    -- { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- -- Window commands
    -- { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },
  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    clue.gen_clues.builtin_completion(),
    -- clue.gen_clues.g(),
    -- clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    -- clue.gen_clues.windows(),
    clue.gen_clues.z(),
    { mode = 'n', keys = '<leader>f', desc = string.format("+%d %s %s", count("n", '^ f.'), getIcons('finder'), "Find") },
    { mode = 'n', keys = '<leader>F', desc = string.format("+%d %s %s", count("n", '^ F.'), getIcons('finder'), "Find") },
  },
}
options.window = {
  -- Floating window config
  config = {},

  -- Delay before showing clue window
  delay = 500,

  -- Keys to scroll inside the clue window
  scroll_down = '<C-d>',
  scroll_up = '<C-u>',
}
return clue.setup(options)
