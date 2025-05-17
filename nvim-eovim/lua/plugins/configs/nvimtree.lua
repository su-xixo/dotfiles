local tree = require("nvim-tree")
local function _on_attack()
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach()
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
end
local options = {
  on_attach = _on_attack(),
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
        modified = "󰐖", -- NOTE string: *●*, 󰐖
        hidden = "󰰀", -- NOTE string: *󰜌*, 󰰀, 󰘓
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "", -- NOTE , ➜
          untracked = "󰩴", -- NOTE 󰩴, ★
          deleted = "",
          ignored = "◌", -- NOTE ◌, , 
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true, -- chnage root dir if file is from other location
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
    prefix = "[FILTER]: ",
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
