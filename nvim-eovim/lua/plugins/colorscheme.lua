return {
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    priority = 1000,
    lazy = false,
    init = function()
      vim.cmd("colorscheme kanagawa")
    end,
    config = function()
      return require "plugins.configs.colorscheme.kanagawa"
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    priority = 1000 ,
    init = function ()
      vim.cmd("colorscheme gruvbox")
    end,
    config = function ()
      require('plugins.configs.colorscheme.gruvbox')
    end
  },
}
