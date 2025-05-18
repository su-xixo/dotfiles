local getIcon = require("core.icons").get_icons
-- local indent = require('ibl')
-- local miniIndent = require('mini.indentscope')
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

-- indent.setup({
--   indent = {
--     char = getIcon("indent", 2),
--     tab_char = getIcon("indent", 2),
--   },
--   scope = { show_start = false, show_end = false },
--   exclude = {
--     filetypes = exclude_items,
--   },
-- })
--
-- miniIndent.setup({
--   symbol = indent_symbol[2],
--   options = { try_as_border = true },
-- })

indentmini.setup({
  char = getIcon("indent", 1),
  exclude = exclude_items,
})
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = exclude_items,
--   callback = function()
--     vim.b.miniindentscope_disable = true
--   end,
-- })
-- vim.api.nvim_create_autocmd({"BufEnter"}, {
--   callback = function(args)
--     local ignore_filetype = {
--       'NvimTree',
--     }
--     if vim.tbl_contains(ignore_filetype, vim.bo[args.buf].filetype) then
--       vim.b.miniindentscope_disable = true
--     end
--   end,
-- })

