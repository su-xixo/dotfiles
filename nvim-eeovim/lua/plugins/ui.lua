return {
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
}
