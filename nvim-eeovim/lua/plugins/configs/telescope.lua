local telescope = require("telescope")
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
    prompt_prefix = require("core.icons").get_icons("picker", "prompt_prefix")
      .. "  ",
    selection_caret = require("core.icons").get_icons(
      "picker",
      "selection_caret"
    ) .. " ",
  },
}
telescope.setup(options)
