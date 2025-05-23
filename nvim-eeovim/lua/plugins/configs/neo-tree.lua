local icons = require('core.icons')
local neotree = require("neo-tree")
local options = {
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "document_symbols",
  },
  close_if_last_window = true,
  enable_cursor_hijack = false,
  popup_border_style = "single", -- @type "NC", "double", "rounded", "single", "solid", ""(to use winborder)
  default_component_configs = {
    diagnostics = {
      symbols = {
        hint = "H",
        info = "I",
        warn = "W",
        error = "E",
      },
      highlights = {
        hint = "DiagnosticSignHint",
        info = "DiagnosticSignInfo",
        warn = "DiagnosticSignWarn",
        error = "DiagnosticSignError",
      },
    },
    indent = {
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = icons.tree.collapse[1],
      expander_expanded = icons.tree.expand[1],
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = icons.tree.folder.close,
      folder_open = icons.tree.folder.open,
      folder_empty = icons.tree.folder.empty_close,
      folder_empty_open = icons.tree.folder.empty_open,
      default = "*",
      highlight = "NeoTreeFileIcon",
    },
    git_status = {
      symbols = {
        -- Change type
        added = icons.git.added, -- NOTE: you can set any of these to an empty string to not show them
        deleted = icons.git.deleted,
        modified = icons.git.modified,
        renamed = icons.git.renamed,
        -- Status type
        untracked = icons.git.untracked[5],
        ignored = icons.git.ignored[1],
        unstaged = icons.git.unstaged[1],
        staged = icons.git.staged[1],
        conflict = icons.git.conflict[1],
      },
      align = "right",
    },
  },
  window = {
    width = 30,
    mappings = {
      ["g?"] = "show_help",
      ["<space>"] = false,
      ["<Esc>"] = {
        function(state)
          local window = require("neo-tree.ui.renderer").window_exists(state)
          local preview = require("neo-tree.sources.common.preview")
          if preview.is_active() then
            state.commands.cancel()
          elseif window then
            state.commands.close_window(state)
          end
        end,
        desc = "close floating window+tree",
      },
      ["I"] = "toggle_gitignore",
      ["zC"] = "close_all_nodes",
      ["zM"] = "close_all_subnodes",
      ["zO"] = "expand_all_nodes",
      ["zR"] = "expand_all_subnodes",
      ["l"] = "open",
      ["h"] = {
        function(state)
          local node = state.tree:get_node()
          require("neo-tree.ui.renderer").focus_node(
            state,
            node:get_parent_id()
          )
        end,
        desc = "Navigate parent node",
      },
      -- ["g"] = function(state)
      --   -- vim.print(state)
      --   local node = state.tree:get_node()
      --   vim.print(node)
      -- end,
    },
  },
}
vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*lazygit",
  callback = function()
    if package.loaded["neo-tree.sources.git_status"] then
      require("neo-tree.sources.git_status").refresh()
    end
  end,
})
neotree.setup(options)
