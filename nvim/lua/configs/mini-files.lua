local H = {}
local options = {}
local miniFiles = require("mini.files")

H.create_autocommand = function()
	local minifiles_augroup = vim.api.nvim_create_augroup("ek-mini-files", {})
	local au = function(pattern, callback)
		vim.api.nvim_create_autocmd("User", { group = minifiles_augroup, pattern = pattern, callback = callback })
	end

	au("MiniFilesExplorerOpen", function() -- bookmarks, alternative is visits_harpooned
		MiniFiles.set_bookmark("c", vim.fn.stdpath("config") .. "", { desc = "Neovim config" })
		MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
		MiniFiles.set_bookmark("C", vim.fn.expand("~/.config"), { desc = "Config directory" })
		if vim.fn.isdirectory(vim.fn.expand("~/dotfiles")) ~= 0 then
			MiniFiles.set_bookmark("d", vim.fn.expand("~/dotfiles"), { desc = "Dotfiles directory" })
		end
		MiniFiles.set_bookmark("~", vim.fn.expand("~"), { desc = "Home directory" })
	end)

	au("MiniFilesBufferCreate", function(args)
		local map_buf = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { buffer = args.data.buf_id })
		end
    -- stylua: ignore start
    map_buf("<CR>", function() MiniFiles.go_in({ close_on_file = true }) end)
    map_buf("<Right>", function() MiniFiles.go_in({ close_on_file = true }) end)

    map_buf("<BS>", function() MiniFiles.go_out() end)
    map_buf("<Left>", function() MiniFiles.go_out() end)

    map_buf("<Esc>", function() MiniFiles.close() end)

		-- Add extra mappings from *files-examples*
		-- stylua: ignore end
	end)
end

H.max_number = 3
H.width_focus = 25
H.width_nofocus = 15
-- H.width_preview = function()
--   local previewWidth = 0
--   local clms = vim.api.nvim_get_option_value("columns", {})
--   previewWidth = (clms - (H.width_focus + H.width_nofocus))
--   previewWidth = math.abs(previewWidth)
--   print(clms, previewWidth)
--   if previewWidth < 30 then
--     return 50
--   end
--   -- print(previewWidth .. " is preview width")
--   return previewWidth
-- end
H.width_preview = 50

options.mappings = {
	close = "q",
	go_in = "L",
	go_in_plus = "l",
	go_out = "h",
	go_out_plus = "H",
	mark_goto = "'",
	mark_set = "m",
	reset = "<BS>",
	reveal_cwd = "@",
	show_help = "g?",
	synchronize = "=",
	trim_left = "<",
	trim_right = ">",
}

options.windows = {
	preview = true,
	max_number = H.max_number, -- math.huge,
	width_focus = H.width_focus,
	width_nofocus = H.width_nofocus,
	width_preview = H.width_preview,
}
H.create_autocommand()
return miniFiles.setup(options)
