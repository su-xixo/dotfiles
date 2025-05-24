return {
  {
    "echasnovski/mini.align",
    enabled = true,
    event = { "BufReadPost", "BufWritePost" },
    version = "*",
    config = function()
      require("mini.align").setup({})
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "gerazov/toggle-bool.nvim",
    keys = {
      { "<leader>tt", desc = "toggle bool" },
    },
    config = function()
      require("toggle-bool").setup({
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
      })
    end,
  },
}
