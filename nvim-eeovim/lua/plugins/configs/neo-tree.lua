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
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰉖",
      folder_empty_open = "󰷏",
      default = "*",
      highlight = "NeoTreeFileIcon",
    },
    git_status = {
      symbols = {
        -- Change type
        added = "✚", -- NOTE: you can set any of these to an empty string to not show them
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
      align = "right",
    },
  },
  window = {
    width = 30,
    mappings = {
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
    },
    ["zC"] = "close_all_nodes",
    ["zM"] = "close_all_subnodes",
    ["zO"] = "expand_all_nodes",
    ["zR"] = "expand_all_subnodes",
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
