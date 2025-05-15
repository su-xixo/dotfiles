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
      return require("configs.mini.formatter")
    end,
  },
}
