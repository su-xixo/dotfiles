return {
  {
    'echasnovski/mini.basics', version = '*',
    name = "mini-basics",
    event = "VeryLazy",
    config = function ()
      return require("plugins.configs.mini.basics")
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {},
    config = ...,
  },
  {
    "echasnovski/mini.files",
    version = '*',
    name = "mini-files",
    config = function ()
      return require "plugins.configs.mini.files"
    end

  },
  {
    "echasnovski/mini.clue",
    version = '*',
    name = "mini-clue",
    event = "VeryLazy",
    config = function ()
      return require "plugins.configs.mini.clue"
    end
  },
  {
    "echasnovski/mini.ai",
    version = '*',
    name = "mini-ai",
    config = function ()
      return require "plugins.configs.mini.ai"
    end
  },
  {
    "echasnovski/mini.pick",
    version = '*',
    name = "mini-pick",
    dependencies = { 'echasnovski/mini.extra', version = '*', },
    cmd = "Pick",
    keys = function ()
      return require("core.mappings").pick
    end,
    config = function ()
      return require("plugins.configs.mini.pick")
    end
  },
}
