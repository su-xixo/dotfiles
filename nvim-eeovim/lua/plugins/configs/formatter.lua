local conform = require("conform")
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
local formatter = {
  lua = { "stylua" },
  python = { "isort", "black" },
  rust = { "rustfmt", lsp_format = "fallback" },
  javascript = { "prettierd", "prettier", stop_after_first = true },
  sh = { "shfmt" },
}
return conform.setup({
  formatters_by_ft = formatter,
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})
