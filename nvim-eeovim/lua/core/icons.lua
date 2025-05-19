local H = {}
H.icons = {
  notfound = '󰱞',
  finder = "",
  folder_close = "",
  folder_empty = "",
  folder_empty_open = "",
  folder_open = "",
  folder_symlink = "",
  folder_symlink_open = "",
  folder_filter = "󱧋",
  modified = "󰐖",
  hidden = "󰰀",
  unstaged = "✗",
  staged = "✓",
  unmerged = "",
  renamed = "",
  untracked = "󰩴",
  deleted = "",
  ignored = "◌",
  indent = {
    [1] = "▏",
    [2] = "│",
    [3] = "┊",
    [4] = "╎",
  },
  picker = {
    prompt_prefix = "",
    selection_caret = "❯",
    multi_icon = "▏",
  },
}
H.get_icons = function (...)
  if select('#', ...) == 0 then
    vim.print("Pass icon key...")
  else
    local item = vim.tbl_get(H.icons, ...)
    if item ~= nil then
      return item
    else
      return vim.tbl_get(H.icons, "notfound")
    end
  end
end
H.text_icons = {}

-- vim.print(H.get_icons())
-- vim.print(H.get_icons("indent", 1))
-- vim.print(H.get_icons('finder'))
-- vim.print(H.get_icons('finr'))
return H
