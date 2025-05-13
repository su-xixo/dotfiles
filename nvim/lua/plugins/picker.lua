return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
  },
  {
    "ibhagwan/fzf-lua",
    cmd = { "FzfLua" },
    keys = function ()
      return require("mappings").fzf_lua
    end,
    config = ...,
  },
}
