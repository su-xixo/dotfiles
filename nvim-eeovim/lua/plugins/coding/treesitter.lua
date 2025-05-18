return {
  "nvim-treesitter/nvim-treesitter",
  -- event = require("core.my_default").option.event,
  event = eovim.option.events,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUninstall", "TSUpdate" },
  build = ":TSUpdate",
  config = function ()
    require("plugins.configs.treesitter")
  end
}
