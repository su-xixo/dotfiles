return {
  "nvim-treesitter/nvim-treesitter",
  event = eovim.option.events,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
  build = ":TSUpdate",
  config = function ()
    require("plugins.configs.treesitter")
  end
}
