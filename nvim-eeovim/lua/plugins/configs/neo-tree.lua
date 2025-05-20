local neotree = require("neo-tree")
local options = {
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  default_component_configs = {
    indent = {
      with_markers = false,
    },
    name = {
      highlight_opened_files = true,
    },
    git_status = {
      symbols = {
        -- Change type
        added = "✚",
        deleted = "✖",
        modified = "",
        renamed = "󰁕",
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },
    diagnostics = {
      symbols = {
        hint = "H",
        info = "I",
        warn = "!",
        error = "X",
      },
      highlights = {
        hint = "DiagnosticSignHint",
        info = "DiagnosticSignInfo",
        warn = "DiagnosticSignWarn",
        error = "DiagnosticSignError",
      },
    },
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
  },
}

neotree.setup(options)
