return {
  {
    "echasnovski/mini.files",
    version = "*",
    name = "mini-files",
    init = function ()
      vim.cmd("colorscheme kanagawa")
    end,
    keys = require("core.mappings").getmap("tree", "minifiles"),
    config = function()
      return require("plugins.configs.mini.files")
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    name = "telescope",
    cmd = { "Telescope" },
    keys = {},
    config = ...
  },
}
