return {
  {
    "echasnovski/mini.files",
    version = "*",
    name = "mini-files",
    keys = require("core.mappings").getmap("tree", "minifiles"),
    config = function()
      return require("plugins.configs.mini.files")
    end,
  },
}
