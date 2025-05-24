return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    opts = {},
  },
  {
    "echasnovski/mini-git",
    enabled = false,
    event = { "BufReadPost", "BufWritePost" },
    version = "*",
    config = function()
      require("mini.git").setup({})
    end,
  },
  {
    "echasnovski/mini.diff",
    event = { "BufReadPost", "BufWritePost" },
    version = "*",
    config = function()
      require("mini.diff").setup({
        view = {
          style = "sign",
          signs = { add = "▒", change = "▒", delete = "▒" },
          priority = 199,
        },
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
