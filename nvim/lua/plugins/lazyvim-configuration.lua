return {
  { "ellisonleao/gruvbox.nvim" },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "catppuccin-mocha",
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
      signature = { enabled = true },
      keymap = {
        preset = "super-tab", -- "enter"
        ["<C-y>"] = { "select_and_accept" },
      },
    },
  },

  {
    "folke/noice.nvim",
    enabled = false,
  },

}
