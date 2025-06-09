return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
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
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
    init = function()
      -- NvimTree as directory explorer on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        desc = "Open NvimTree if started with a directory",
        group = vim.api.nvim_create_augroup("NvimTreeOnDir", { clear = true }),
        callback = function()
          if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            -- require("nvim-tree.api").tree.open { path = vim.fn.argv(0) }
            vim.cmd("NvimTreeOpen" .. vim.fn.argv(0)) -- same as above line
            vim.cmd "wincmd p" -- Move cursor to previous window (nvimtree window)
          end
        end,
      })
    end,
    opts = function()
      require "configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "stevearc/oil.nvim",
    -- event = "VeryLazy",
    -- lazy = false, -- to use oil as default directory explorer. `VeryLazy` will work
    cmd = "Oil",
    opts = {
      default_file_explorer = true,
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
        enabled = false,
      },
    },
    cmd = "FzfLua",
    opts = ...,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "sindrets/diffview.nvim",
    },
    cmd = { "Neogit" },
    opts = ...,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    cond = vim.g.neovide == nil,
    init = function()
      vim.g.minianimate_disable = true
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "Neogit*", "grug-far", "nvdash", "oil", "NvimTree" },
        callback = function()
          vim.b.minianimate_disable = true
        end,
      })
    end,
    opts = function(_, opts)
      return require "configs.mini_animation"
    end,
  },
  {
    "echasnovski/mini.surround",
    -- lazy = false,
    keys = function(_, keys)
      local opts = require("utils").opts "mini.surround"
      local mappings = {
        { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete Surrounding" },
        { opts.mappings.find, desc = "Find Right Surrounding" },
        { opts.mappings.find_left, desc = "Find Left Surrounding" },
        { opts.mappings.highlight, desc = "Highlight Surrounding" },
        { opts.mappings.replace, desc = "Replace Surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      local mappings = vim
        .iter(mappings)
        :filter(function(item)
          return item[1] ~= (nil or "")
        end)
        :totable()
      return (vim.list_extend(mappings, keys))
    end,
    opts = {
      mappings = {
        -- NOTE: `<time>gs` used for sleep. can be acess with `:sleep <time>`
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
  {
    "gerazov/toggle-bool.nvim",
    -- lazy = false,
    keys = function()
      local opts = require("utils").opts "toggle-bool.nvim"
      return opts.mapping
    end,
    opts = {
      mapping = "<leader>tt",
      additional_toggles = {
        left = "right",
        Yes = "No",
        On = "Off",
        ["0"] = "1",
        Enable = "Disable",
        Enabled = "Disabled",
        First = "Last",
        Before = "After",
        Persistent = "Ephemeral",
        Internal = "External",
        Start = "Stop",
        In = "Out",
        Open = "Close",
        Enter = "Exit",
        Lock = "Unlock",
        Connect = "Disconnect",
        Mount = "Dismount",
        Import = "Export",
        Ingress = "Egress",
        Allow = "Deny",
        All = "None",
      },
    },
    config = function(_, opts)
      require("toggle-bool").setup(opts)
      vim.keymap.set("n", opts.mapping or "<leader>tt", function()
        require("toggle-bool").toggle_bool()
      end, { desc = "Toggle value" })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "User FilePost",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "Trouble",
          "alpha",
          "dashboard",
          "fzf",
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "NvimTree",
          "notify",
          "snacks_dashboard",
          "snacks_notif",
          "snacks_terminal",
          "snacks_win",
          "toggleterm",
          "trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
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
