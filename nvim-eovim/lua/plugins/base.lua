return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
    build = ":TSUpdate",
    dependencies = {},
    config = function ()
      return require("plugins.configs.treesitter")
    end
  },
  {
    'stevearc/conform.nvim',
    cmd = {},
    keys  = function ()
      return require("core.mappings").formatter
    end,
    config = function ()
      return require("plugins.configs.formatter")
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function ()
      return require("plugins.configs.mason")
    end,
  },
}
