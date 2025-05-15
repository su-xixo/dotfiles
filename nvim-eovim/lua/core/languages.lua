local H = {}
H.lsp = {
  {"a", "b", "b"},
  python = {"python"},
  "this"
}
H.tools = {
  lua = {
    treesitter = {},
    linter = {},
    dap = {}
  },
  misc = {},
}
H.formatter = {
  lua = { "stylua" },
  python = { "isort", "black" },
  rust = { "rustfmt", lsp_format = "fallback" },
  javascript = { "prettierd", "prettier", stop_after_first = true },
}
function H.ext_fmt()
  local fmt_map = vim.iter(H.formatter):map(function (_, values)
    for _, v in pairs({"lsp_format", "stop_after_first"}) do
      if vim.tbl_contains(vim.tbl_keys(values), v) then
        values[v] = nil -- delete key-value pair
      end
    end
    return values
  end):totable()
  local fmt_flatten = vim.iter(fmt_map):flatten(1):totable()
  -- vim.print(fmt_flatten)
  -- vim.print(fmt_map)
  return fmt_flatten
end

function H.ext_lsp()
  local lsp_map = vim.iter(H.lsp):map(function (_, values)
    return values
  end):totable()
  local lsp_flatten = vim.iter(lsp_map):flatten(1):totable()
  -- vim.print(lsp_flatten)
  return lsp_flatten
end
-- H.ext_fmt()
-- H.ext_lsp()

return H
