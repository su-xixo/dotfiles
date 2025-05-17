return {
  {
    "echasnovski/mini.icons",
    version = '*',
    name = "mini-icons",
    init = function ()
      package.preload["nvim-web-devicons"] = function()
        package.loaded["nvim-web-devicons"] = {}
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function()
      require("mini.icons").setup({
        style = "glyph",
      })
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    version = '*',
    name = "mini-hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
      return require "plugins.configs.mini.hipatterns"
    end

  },
  -- {
  --   "kevinhwang91/nvim-ufo",
  -- event = { "BufReadPost", "BufNewFile" },
  -- dependencies = "kevinhwang91/promise-async",
  -- init = function()
  -- 	vim.o.foldcolumn = "1"
  -- 	vim.o.foldlevel = 99
  -- 	vim.o.foldlevelstart = 99
  -- 	vim.o.foldenable = true
  -- end,
  -- config = function()
  -- 	require("ufo").setup()
  -- end,
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    dependencies = {
      "echasnovski/mini.indentscope",
      version = '*',
      init = function ()
        vim.api.nvim_create_autocmd({"FileType"}, {
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
            "nofile",
            "notify",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_terminal",
            "snacks_win",
            "toggleterm",
            "trouble",
            'help',
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        })
      end,
    },
    config = function ()
      return require("plugins.configs.indent")
    end
  },
}
