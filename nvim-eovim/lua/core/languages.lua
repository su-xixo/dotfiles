local H = {}
H.lsp = {
  lua = { "lua" },
  python = {"ruff", "pylsp"},
  bash = {"bash"},
}
H.tools = {
  lua = {
    treesitter = "lua",
  },
  rust = {
    treesitter = "rust",
  },
  python = {
    treesitter = "python",
  },
  misc = {
    treesitter = {"lua", "luadoc", "vim", "vimdoc", "bash"},
  },
}
H.formatter = {
  lua = { "stylua" },
  python = { "isort", "black" },
  rust = { "rustfmt", lsp_format = "fallback" },
  javascript = { "prettierd", "prettier", stop_after_first = true },
  sh = { "shfmt" },
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

function H.ext_tools(scope) -- @args: all, treesitter, linter, dap
  scope = scope or "all"
  local tools_map = vim.iter(H.tools):map(function (_, values)
    -- vim.print(values[scope])
    if scope == "all" then
      local merge_tbl = {}
      table.insert(merge_tbl, values["treesitter"])
      table.insert(merge_tbl, values["linter"])
      table.insert(merge_tbl, values["dap"])
      return merge_tbl
    end
    if values[scope] then
      return values[scope]
    end
  end):totable()
  -- vim.print(vim.iter(tools_map):flatten(math.huge):totable())
  return vim.iter(tools_map):flatten(math.huge):totable()
end
-- vim.print(vim.fn.uniq(vim.fn.sort(H.ext_tools("treesitter")))) -- vim.fn.uniq() will remove adjacent dups i.e sorting is imp
-- vim.print(H.ext_fmt())
-- vim.print(H.ext_lsp())

return H
