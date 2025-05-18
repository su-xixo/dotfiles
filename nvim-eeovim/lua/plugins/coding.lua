return {
  {
    "neovim/nvim-lspconfig",
    event = eovim.option.events,
    config = function()
      if vim.lsp and vim.lsp.config then
        return require("plugins.configs.lsp").default()
      else
        return require("plugins.configs.lsp").backword_compatible()
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = eovim.option.events,
    lazy = vim.fn.argc(-1) == 0,
    dependencies = {
      -- "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
    cmd = {
      "TSInstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
    },
    keys = {
      { "<c-space>", desc = "Increment Selection", mode = "x" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    build = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },
  {
    "stevearc/conform.nvim",
    keys = function()
      return require("core.mappings").formatter
    end,
    config = function()
      return require("plugins.configs.formatter")
    end,
  },
}
