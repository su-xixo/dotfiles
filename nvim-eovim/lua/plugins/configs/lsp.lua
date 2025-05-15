local servers = {
  "lua_ls",
  "bashls"
}
vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

vim.lsp.config("bashls", {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
})

return vim.lsp.enable(servers)
