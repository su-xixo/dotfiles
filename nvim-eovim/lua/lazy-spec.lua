---@diagnostic disable-next-line: missing-fields
require("lazy").setup({
  spec = {
    { import = "plugins" },
    -- { import = "plugins.base" },
    -- { import = "plugins.editor" },
    -- { import = "plugins.misc" },
    -- { import = "plugins.ui" },
    -- { import = "plugins.ui.colorscheme" },
    -- -- { import = 'plugins.disabled', enable = false },
  },
  defaults = {
    lazy = true,
    version = "*",
  },
  install = {
    missing = true,
    colorscheme = { "habamax", "gruvbox", "kanagawa", "catppuccin" },
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "osc52",
        "parser",
        "gzip",
        "netrwPlugin",
        "health",
        "man",
        "matchit",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "shadafile",
        "spellfile",
        "editorconfig",
      },
    },
  },
  ui = {
    border = vim.g.border_style,
    title = " lazy.nvim ",
    backdrop = 0,
    -- size = { width = 0.9, height = 0.9 },
  },
})

