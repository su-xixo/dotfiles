return {
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufNewFile" },
  config = function()
    if vim.lsp and vim.lsp.config then
      return require("plugins.configs.lsp").default()
    else
      return require("plugins.configs.lsp").backword_compatible()
    end
  end,
}
