local H = {}
H = {
  notfound = "󰱞",
  tree = {
    expand = { [1] = "", [2] = "" },
    collapse = { [1] = "", [2] = "" },
    folder = {
      close = "",
      empty_close = "",
      empty_open = "",
      filter = "󱧋",
      open = "",
      symlink = "",
      symlink_open = "",
    },
  },
  git = {
    -- changw type
    added = "✚",
    deleted = "✖",
    modified = "",
    renamed = "󰁕",
    -- syatus type
    untracked = {
      [1] = "󰳤",
      [2] = "󰩴",
      [3] = "󰀧",
      [4] = "󰞋",
      [5] = "󰩳",
    },
    staged = { [1] = "󰄵", [2] = "󰱒" },
    unstaged = { [1] = "󰄗", [2] = "󱅶" },
    ignored = { [1] = "󱋭", [2] = "󱋬" },
    conflict = { [1] = "", [2] = "" },
  },
  -- folder_close = "",
  -- folder_empty = "",
  -- folder_empty_open = "",
  -- folder_open = "",
  -- folder_symlink = "",
  -- folder_symlink_open = "",
  -- folder_filter = "󱧋",
  -- modified = "󰐖",
  -- hidden = "󰰀",
  -- unstaged = "✗",
  -- staged = "✓",
  -- unmerged = "",
  -- renamed = "",
  -- untracked = "󰩴",
  -- deleted = "",
  -- ignored = "◌",
  indent = {
    [1] = "▏",
    [2] = "│",
    [3] = "┊",
    [4] = "╎",
  },
  picker = {
    prompt = {
      [1] = "󰭎",
      [2] = " ",
    },
    select = {
      [1] = "❯",
      [2] = "▎",
      [3] = "",
    },
    multi = {
      [1] = "+",
    },
  },
}
H.get_icons = function(...)
  if select("#", ...) == 0 then
    vim.print("Pass icon key...")
  else
    local item = vim.tbl_get(H, ...)
    if item ~= nil then
      return item
    else
      return vim.tbl_get(H, "notfound")
    end
  end
end
H.text_icons = {}

-- vim.print(H.get_icons())
-- vim.print(H.get_icons("indent", 1))
-- vim.print(H.get_icons('finder'))
-- vim.print(H.get_icons('finr'))
return H
