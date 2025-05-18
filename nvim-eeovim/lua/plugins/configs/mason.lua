local mason = require("mason")
local mason_tool_installer = require("mason-tool-installer")
local function get_tools()
  local merged_tbl = {}
  table.insert(merged_tbl, eovim.lang.lsp)
  table.insert(merged_tbl, eovim.lang.fmt)
  table.insert(merged_tbl, eovim.lang.linter)
  table.insert(merged_tbl, eovim.lang.dap)
  return vim.iter(merged_tbl):flatten(math.huge):totable()
end

mason.setup({})
mason_tool_installer.setup({
  ensure_installed = get_tools(),
})
