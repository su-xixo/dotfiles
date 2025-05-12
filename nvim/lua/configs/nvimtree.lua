local config = require("nvchad.configs.nvimtree")
local api = require("nvim-tree.api")
local lib = require("nvim-tree.lib")
config.on_attach = function(bufnr)
	local opts = { buffer = bufnr }
	api.config.mappings.default_on_attach(bufnr)
	local lefty = function()
		local node_at_cursor = api.tree.get_node_under_cursor()
		if node_at_cursor.nodes ~= nil then
			api.node.open.edit()
		else
			api.node.navigate.parent()
		end
	end
	local righty = function(focus)
		focus = focus or false
		local node_at_cursor = api.tree.get_node_under_cursor()
		if node_at_cursor.nodes ~= nil then
			api.node.open.edit()
		else
			api.node.open.edit()
			-- -- Close the tree if file was opened
			-- api.tree.close()
			if focus == true then
				api.tree.focus()
			end
		end
	end
	vim.keymap.set("n", "h", lefty, opts)
	vim.keymap.set("n", "<Left>", lefty, opts)
	vim.keymap.set("n", "<Right>", righty, opts)
	vim.keymap.set("n", "l", righty, opts)
	vim.keymap.set("n", "L", function()
		righty(true)
	end, opts)
end
return config
