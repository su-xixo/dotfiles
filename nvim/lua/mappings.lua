require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Open Manager
map("n", "<leader>ol", "<cmd>Lazy<CR>", { desc = "Open lazy manager" })
map("n", "<leader>om", "<cmd>Mason<CR>", { desc = "Open mason manager" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Nvim Tree
map("n", "<leader>E", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Mini Files
map("n", "<leader>e", function()
  -- if not require("mini.files").close() then
  -- 	local buffer_type = vim.bo.buftype
  -- 	if buffer_type == "nofile" then
  -- 		return
  -- 	end
  -- 	local buffer_name = vim.api.nvim_buf_get_name(0)
  -- 	if buffer_name then
  -- 		require("mini.files").open(buffer_name)
  -- 	end
  -- end
  if not require("mini.files").close() then
    require("mini.files").open()
  end
end, { noremap = true, desc = "Open mini files" })

map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
