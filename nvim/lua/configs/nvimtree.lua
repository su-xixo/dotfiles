local config = require "nvchad.configs.nvimtree"
local api = require "nvim-tree.api"
config.on_attach = function(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local lefty = function(want_focus)
    want_focus = want_focus or false
    local cur_node = api.tree.get_node_under_cursor()
    api.node.open.edit(cur_node, { focus = want_focus })
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  -- vim.keymap.set('n', 'l',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set("n", "l", function()
    lefty(true)
  end, opts "open: node + focus on buffer")
  vim.keymap.del("n", "L", { buffer = bufnr })
  vim.keymap.set("n", "L", function()
    lefty(false)
  end, opts "open: node + focus on tree")
  vim.keymap.set("n", "<Right>", function()
    lefty(true)
  end, opts "open: node + focus on buffer")

  vim.keymap.set("n", "h", api.node.navigate.parent, opts "goto parent node")
  vim.keymap.set("n", "<Left>", api.node.navigate.parent, opts "goto parent node")
end

return config
