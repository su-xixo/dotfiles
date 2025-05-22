return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
  },
  {
    "ibhagwan/fzf-lua",
    event = "BufEnter",
    cmd = { "FzfLua" },
    keys = function ()
      return require("mappings").fzf_lua
    end,
    config = function ()
      require('fzf-lua').setup({
        winopts = {
          border = "single",
          backdrop = false,
        }
      })
    end
  },
}
