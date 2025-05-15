local lang = require("core.languages")
local conform = require("conform")
-- make available conform.format()
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
return conform.setup({
  formatters_by_ft = lang.formatter,
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})
