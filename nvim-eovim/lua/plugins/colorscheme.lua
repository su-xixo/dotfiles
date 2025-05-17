return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    init = function ()
      vim.cmd("colorscheme gruvbox")
    end,
    config = function ()
      require('plugins.configs.colorscheme.gruvbox')
    end
  },
}
