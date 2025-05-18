return {
  {
    'echasnovski/mini.basics', version = '*',
    name = "mini-basics",
    event = "VeryLazy",
    cnfig = function ()
      return require("plugins.configs.mini.basics")
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function ()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
    end,
    config = function()
      return require "plugins.configs.nvimtree"
    end,
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
    -- event = "VeryLazy",
    keys = { "<space>", "g", "z", "\"", "\'" },
    config = function ()
      return require "plugins.configs.mini.clue"
    end
  },
  {
    "echasnovski/mini.ai",
    version = '*',
    name = "mini-ai",
    -- keys = { "v" },
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      return require "plugins.configs.mini.ai"
    end
  },
  {
    "echasnovski/mini.splitjoin",
    version = '*',
    keys = { { mode = "n", "gS" }, { mode = "v", "gS" } },
    name = "mini-splitjoin",
    config = function ()
      return require "plugins.configs.mini.splitjoin"
    end
  },
  {
    'echasnovski/mini.trailspace', version = '*',
    name = "mini-trailspace",
    keys = function ()
      return require("core.mappings").trailspace
    end,
    config = function ()
      require("mini-trailspace").setup({})
    end
  },
  {
    "echasnovski/mini.surround",
    version = '*',
    name = "mini-surround",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      return require "plugins.configs.mini.surround"
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      })
    end,
  },
  {
    "echasnovski/mini.pick",
    version = '*',
    name = "mini-pick",
    cmd = "Pick",
    dependencies = {
      {
        'echasnovski/mini.extra',
        version = '*',
        name = "mini-extra",
        config = function ()
          require("mini.extra").setup()
        end
      },
    },
    keys = function ()
      return require("core.mappings").pick
    end,
    config = function ()
      return require("plugins.configs.mini.pick")
    end
  },
}
