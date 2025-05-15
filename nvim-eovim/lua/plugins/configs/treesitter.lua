local lang = require("core.languages")
local treesitter = require("nvim-treesitter.configs")
-- lang.ext_tools("treesitter")
return treesitter.setup({
  highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = { enable = true },
  ensure_installed = lang.ext_tools(),
	auto_install = true,
})
