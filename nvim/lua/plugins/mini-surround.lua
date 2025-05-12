return {
	'echasnovski/mini.surround',
	event = { "BufReadPre", "BufWritePre" },
	config = function()
		require("mini.surround").setup()
	end,
}
