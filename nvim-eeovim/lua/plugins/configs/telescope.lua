local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

local options = {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        mirror = false,
      },
    },
    sorting_strategy = "ascending",
    prompt_prefix = require("core.icons").picker.prompt[1] .. " ",
    selection_caret = require("core.icons").picker.select[1] .. " ",
    multi_icon = require("core.icons").picker.multi[1],
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    dynamic_preview_title = true,
    results_title = false, -- *Results*
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["jk"] = actions.close,
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<M-p>"] = action_layout.toggle_preview,
        ["<S-down>"] = actions.preview_scrolling_down,
        ["<S-up>"] = actions.preview_scrolling_up,
        ["<S-left>"] = actions.preview_scrolling_left,
        ["<S-right>"] = actions.preview_scrolling_right,
      },
      n = {
        ["<Esc>"] = actions.close,
        ["q"] = actions.close,
      },
    },
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}
telescope.setup(options)
telescope.load_extension("fzf")
