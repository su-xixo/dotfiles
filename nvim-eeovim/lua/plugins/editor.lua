return {
  {
    "echasnovski/mini.files",
    version = "*",
    name = "mini-files",
    init = function()
      vim.cmd("colorscheme kanagawa")
    end,
    keys = require("core.mappings").getmap("tree", "minifiles"),
    config = function()
      return require("plugins.configs.mini.files")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = require("core.mappings").getmap("tree", "neotree"),
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("plugins.configs.neo-tree")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = require("core.mappings").getmap("trouble"),
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = "BufEnter",
    name = "telescope",
    cmd = { "Telescope" },
    keys = require("core.mappings").getmap("picker", "telescope"),
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-symbols.nvim",
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPost", "BufWritePost" },
    version = "*",
    config = function()
      require("plugins.configs.mini.hipatterns")
    end,
  },
  {
    "echasnovski/mini.ai",
    event = { "BufReadPost", "BufWritePost" },
    version = "*",
    config = function()
      require("plugins.configs.mini.ai")
    end,
  },

}
