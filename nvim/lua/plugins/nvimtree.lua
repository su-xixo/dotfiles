return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	opts = function()
		require("configs.nvimtree")
	end,
}
