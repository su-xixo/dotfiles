local tree = require("nvim-tree")
local getIcon = require("core.icons").get_icons

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local lefty = function (want_focus)
    want_focus = want_focus or false
    local cur_node = api.tree.get_node_under_cursor()
    api.node.open.edit(cur_node, {focus = want_focus})
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  -- vim.keymap.set('n', 'l',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set("n", "l", function () lefty(true) end, opts("open: node + focus on buffer"))
  vim.keymap.del("n", "L", {buffer = bufnr})
  vim.keymap.set("n", "L", function () lefty(false) end, opts("open: node + focus on tree"))
  vim.keymap.set("n", "<Right>", function () lefty(true) end, opts("open: node + focus on buffer"))

  vim.keymap.set("n", "h", api.node.navigate.parent, opts("goto parent node"))
  vim.keymap.set("n", "<Left>", api.node.navigate.parent, opts("goto parent node"))
end

local options = {
  on_attach = my_on_attach,
  hijack_cursor = true,
  disable_netrw = true,
  auto_reload_on_write = true,
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  select_prompts = true,
  view = {
    cursorline = false,
    width = 30,
    preserve_window_proportions = true,
    number = false,
    relativenumber = false,
  },
  renderer = {
    root_folder_label = false,
    hidden_display = "simple", -- @type "none"|"simple"|"all"
    highlight_git = true,
    highlight_diagnostics = "icon", -- NOTE none, icon, name, all
    highlight_hidden = "all", -- NOTE none, icon, name, all
    highlight_bookmarks = "none", -- NOTE none, icon, name, all
    highlight_modified = "all", -- NOTE none, icon, name, all
    indent_markers = {
      enable = true,
      icons = {
        corner = "└", -- @type "╰"|"└"
      },
    },
    icons = {
      glyphs = {
        default = "󰈚", -- NOTE string: **, 󰈚
        modified = getIcon "modified", -- NOTE string: *●*, 󰐖
        hidden = getIcon "hidden", -- NOTE string: *󰜌*, 󰰀, 󰘓
        folder = {
          default = getIcon "folder_close",
          empty = getIcon "folder_empty",
          empty_open = getIcon "folder_empty_open",
          open = getIcon "folder_open",
          symlink = getIcon "folder_symlink",
          symlink_open = getIcon "folder_symlink_open",
        },
        git = {
          unstaged = getIcon "unstaged",
          staged = getIcon "staged",
          unmerged = getIcon "unmerged",
          renamed = getIcon "renamed", -- NOTE , ➜
          untracked = getIcon "untracked", -- NOTE 󰩴, ★
          deleted = getIcon "deleted",
          ignored = getIcon "ignored", -- NOTE ◌, , 
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = {
      enable = false, -- chnage root dir if file is from other location
      ignore_list = {}, -- this change root-dir
    },
  },
  modified = {
    enable = true,
  },
  filters = {
    enable = true, -- nvim-tree-api.tree.toggle_enable_filters()
    git_ignored = true, -- I | nvim-tree-api.tree.toggle_gitignore_filter()
    dotfiles = false, -- H | nvim-tree-api.tree.toggle_hidden_filter()
    git_clean = false, -- C | nvim-tree-api.tree.toggle_git_clean_filter()
    no_buffer = false,
    no_bookmark = false,
    custom = {},
    exclude = {},
  },
  live_filter = {
    prefix = getIcon "folder_filter" .. " ",
    always_show_folders = false, -- show filter folder
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    expand_all = {
      max_folder_discovery = 300,
      exclude = { ".git", "target", "build" },
    },
    open_file = {
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  tab = {
    sync = {
      open = true,
      close = true,
      ignore = {},
    },
  },
  help = {
    sort_by = "desc", -- NOTE desc, key
  },
}
tree.setup(options)

-- require("nvim-tree.api").git.reload()
