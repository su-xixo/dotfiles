local indent = require('ibl')
local miniIndent = require('mini.indentscope')
local indent_symbol = {
  "▏",
  "│",
  "┊",
  "╎",
}
local exclude_items = {
  "NvimTree",
  "Trouble",
  "alpha",
  "dashboard",
  "fzf",
  "help",
  "lazy",
  "mason",
  "neo-tree",
  "nofile",
  "notify",
  "snacks_dashboard",
  "snacks_notif",
  "snacks_terminal",
  "snacks_win",
  "toggleterm",
  "trouble",

}

indent.setup({
  indent = {
    char = indent_symbol[2],
    tab_char = indent_symbol[2],
  },
  scope = { show_start = false, show_end = false },
  exclude = {
    filetypes = exclude_items,
  },
})

miniIndent.setup({
  symbol = indent_symbol[2],
  options = { try_as_border = true },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = exclude_items,
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
