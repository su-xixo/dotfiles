local getIcons = require("core.icons").get_icons
local indentmini = require("indentmini")
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
indentmini.setup({
  char = getIcons("indent", 2),
  exclude = exclude_items,
})
