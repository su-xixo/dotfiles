local o = vim.opt
local g = vim.g

local M = {}
M.initial = function()
  -- custom global variable
  g.have_nerd_font = false
  g.border_style = "none" ---@type "single"|"double"|"rounded"|"none"

  -- general setting
  o.number = true
  o.relativenumber = true
  o.cursorline = true
  o.signcolumn = "yes"
  o.mouse = "a"
  o.mousemodel = "extend"
  o.confirm = true
  o.inccommand = "split"
  -- vim.schedule(function()
  --   o.clipboard = 'unnamedplus'
  -- end)

  -- tab/indentation
  o.breakindent = true
  o.tabstop = 2
  o.shiftwidth = 2
  o.softtabstop = 2
  o.expandtab = true
  o.smartindent = true

  -- search
  o.ignorecase = true
  o.smartcase = true
  o.hlsearch = true
  o.incsearch = true

  -- file handeling
  o.undofile = true
  o.undodir = vim.fn.stdpath("data") .. "/undo"
  o.swapfile = false
  o.backup = false

  -- perfomance
  o.timeout = true
  o.ttimeout = true
  o.updatetime = 250
  o.timeoutlen = 300
  o.lazyredraw = true
  o.ttimeoutlen = 10

  -- ui
  o.list = true
  o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
  o.showmode = false
  o.laststatus = 3
  o.statusline = "%f %h%m%r%=%y [%l:%c] %P"

  -- window management
  o.splitright = true
  o.splitbelow = true
  o.scrolloff = 8
  o.sidescrolloff = 8
  o.wrap = false

  -- disable unused provider
  g.loaded_python3_provider = 0
  g.loaded_ruby_provider = 0
  g.loaded_node_provider = 0
  g.loaded_perl_provider = 0

end
return M

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
-- vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)

-- Enable break indent
-- vim.opt.breakindent = true

-- Save undo history
-- vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = 'yes'

-- Decrease update time
-- vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
-- vim.opt.confirm = true

