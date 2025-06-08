return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      require "configs.nvimtree"
    end,
  },
  {
    'stevearc/oil.nvim',
    -- event = 'VeryLazy',
    cmd = 'Oil',
    opts = {
      win_options = {
        relativenumber = true,
      },
      watch_for_changes = true,
      keymaps = {
        ["<C-s>"] = false,
        ["g%"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = false,
        ["g-"] = { "actions.select", opts = { horizontal = true } },
      },

    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        enabled = false
      },
    },
    cmd = "FzfLua",
    opts = ...,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
