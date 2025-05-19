return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function ()
      require("plugins.configs.colorscheme.kanagawa")
    end
  },
  {
    "nvimdev/indentmini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.cmd.highlight("IndentLine guifg=gray30")
      vim.cmd.highlight("IndentLineCurrent guifg=gray70")
    end,
    config = function()
      return require("plugins.configs.indent")
    end,
  },
  {
    "echasnovski/mini.icons",
    version = "*",
    event = "VeryLazy",
    init = function()
      package.preload["nvim-web-devicons"] = function()
        package.loaded["nvim-web-devicons"] = {}
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function()
      require("mini.icons").setup()
    end,
  },
}
