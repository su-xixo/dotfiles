-- local treesitter_context = require("treesitter-context")
local treesitter = require("nvim-treesitter.configs")
local context_option = {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = false, -- Enable multiwindow support.
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
local options = {
  ensure_installed = eovim.lang.treesitter,
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      include_surrounding_whitespace = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.inner",
        ["ax"] = "@attribute.outer",
        ["ix"] = "@attribute.inner",
        ["i/"] = "@comment.inner",
        ["a/"] = "@comment.outer",
        ["i#"] = "@comment.inner",
        ["a#"] = "@comment.outer",
        ["i*"] = "@comment.inner",
        ["a*"] = "@comment.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]a"] = "@parameter.outer",
        ["]b"] = "@block.outer",
        ["]s"] = "@statement.outer",
        ["]x"] = "@attribute.outer",
        ["]*"] = "@comment.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
        ["]A"] = "@parameter.outer",
        ["]B"] = "@block.outer",
        ["]S"] = "@statement.outer",
        ["]X"] = "@attribute.outer",
        ["]?"] = "@comment.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[a"] = "@parameter.outer",
        ["[b"] = "@block.outer",
        ["[s"] = "@statement.outer",
        ["[x"] = "@attribute.outer",
        ["[*"] = "@comment.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
        ["[A"] = "@parameter.outer",
        ["[B"] = "@block.outer",
        ["[S"] = "@statement.outer",
        ["[X"] = "@attribute.outer",
        ["[?"] = "@comment.outer",
      },
    },
  },
}

vim.treesitter.language.register("bash", "zsh")
treesitter.setup(options)
-- treesitter_context.setup(context_option)
