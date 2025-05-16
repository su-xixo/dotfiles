local indent = require('ibl')
local miniIndent = require('mini.indentscope')
local indent_symbol = {
  "▏",
  "│",
  "┊",
  "╎",
}

indent.setup({
  indent = {
    char = indent_symbol[2],
    tab_char = indent_symbol[2],
  },
  scope = { show_start = false, show_end = false },
  exclude = {
    filetypes = {
      "Trouble",
      "alpha",
      "dashboard",
      "help",
      "lazy",
      "mason",
      "neo-tree",
      "notify",
      "snacks_dashboard",
      "snacks_notif",
      "snacks_terminal",
      "snacks_win",
      "toggleterm",
      "trouble",
    },
  },
})

miniIndent.setup({
  symbol = indent_symbol[2],
  options = { try_as_border = true },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "Trouble",
    "alpha",
    "dashboard",
    "fzf",
    "help",
    "lazy",
    "mason",
    "neo-tree",
    "notify",
    "snacks_dashboard",
    "snacks_notif",
    "snacks_terminal",
    "snacks_win",
    "toggleterm",
    "trouble",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
