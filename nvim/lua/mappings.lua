-- stylua: ignore start
local utils = require('utils')
require "nvchad.mappings"

if not utils.has('telescope') then
  vim.keymap.del("n", "<leader>fw")
  vim.keymap.del("n", "<leader>fb")
  vim.keymap.del("n", "<leader>fh")
  vim.keymap.del("n", "<leader>ma")
  vim.keymap.del("n", "<leader>fo")
  vim.keymap.del("n", "<leader>fz")
  vim.keymap.del("n", "<leader>cm")
  vim.keymap.del("n", "<leader>gt")
  vim.keymap.del("n", "<leader>pt")
  vim.keymap.del("n", "<leader>th")
  vim.keymap.del("n", "<leader>ff")
  vim.keymap.del("n", "<leader>fa")
end

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- formatter
map({ 'n', 'x' }, "<leader>=", function() require('conform').format() end, { desc = "Format code" })


-- Tree ( NvimTree + MiniFiles )
map("n", "<leader>e", function()
  local api = require "nvim-tree.api"
  api.tree.toggle { path = vim.fn.getcwd(), find_file = false, update_root = false, focus = true }
end, { desc = "Tree(root)" })

map("n", "<leader>E", function()
  local api = require "nvim-tree.api"
  api.tree.toggle { path = vim.fn.getcwd(), find_file = false, update_root = false, focus = true }
end, { desc = "Tree(cwd)" })

map("n", "<C-n>", function ()
  return vim.cmd("NvimTreeToggle" .. vim.uv.cwd())
end, { desc = "nvimtree toggle window" })

map('n', "<leader>fm", function()
  vim.cmd((vim.bo.filetype == 'oil') and "lua require('oil.actions').close.callback()" or 'Oil')
end, { desc = "Open Explorer(Directory of current file)" })
map('n', "<leader>fM", function()
  if vim.bo.filetype == 'oil' then
    require('oil.actions').close.callback()
  else
    require('oil').open(vim.uv.cwd())
  end
end, { desc = "Open Explorer(cwd)" })

-- Picker ( fzf-lua / mini.pick )
-- files
map("n", "<leader>fc", function() require "fzf-lua".files { cwd = vim.fn.stdpath "config" } end, { desc = "Find Config File" })
map("n", "<leader>ff", function() require "fzf-lua".files { cwd = vim.fn.getcwd() } end, { desc = "Find Files (Root Dir)" })
map("n", "<leader>fF", function() require "fzf-lua".files { cwd = vim.fn.getcwd() } end, { desc = "Find Files (cwd)" })
map("n", "<leader>fg", function() require "fzf-lua".git_files() end, { desc = "Find Files (git-files)" })
map("n", "<leader>fr", function() require "fzf-lua".oldfiles() end, { desc = "Recent" })
map("n", "<leader>fR", function() require "fzf-lua".oldfiles { cwd = vim.uv.cwd() } end, { desc = "Recent (cwd)" })
-- git
map("n", "<leader>gc", function() require "fzf-lua".git_commits() end, { desc = "Commits" })
map("n", "<leader>gs", function() require "fzf-lua".git_status() end, { desc = "Status" })
-- search
map("n", '<leader>s"', function() require('fzf-lua').registers() end, { desc = "Registers" } )
map("n", "<leader>sa", function() require('fzf-lua').autocmds() end, { desc = "Auto Commands" } )
map("n", "<leader>sb", function() require('fzf-lua').grep_curbuf() end, { desc = "Buffer" } )
map("n", "<leader>sc", function() require('fzf-lua').command_history() end, { desc = "Command History" } )
map("n", "<leader>sC", function() require('fzf-lua').commands() end, { desc = "Commands" } )
map("n", "<leader>sd", function() require('fzf-lua').diagnostics_document() end, { desc = "Document Diagnostics" } )
map("n", "<leader>sD", function() require('fzf-lua').diagnostics_workspace() end, { desc = "Workspace Diagnostics" } )
map("n", "<leader>sg", function() require('fzf-lua').live_grep({ cwd = vim.fn.getcwd() }) end, { desc = "Grep (Root Dir)" } )
map("n", "<leader>sG", function() require('fzf-lua').live_grep({ cwd = vim.uv.cwd() }) end, { desc = "Grep (cwd)" } )
map("n", "<leader>sh", function() require('fzf-lua').help_tags() end, { desc = "Help Pages" } )
map("n", "<leader>sH", function() require('fzf-lua').highlights() end, { desc = "Search Highlight Groups" } )
map("n", "<leader>sj", function() require('fzf-lua').jumps() end, { desc = "Jumplist" } )
map("n", "<leader>sk", function() require('fzf-lua').keymaps() end, { desc = "Key Maps" } )
map("n", "<leader>sl", function() require('fzf-lua').loclist() end, { desc = "Location List" } )
map("n", "<leader>sM", function() require('fzf-lua').man_pages() end, { desc = "Man Pages" } )
map("n", "<leader>sm", function() require('fzf-lua').marks() end, { desc = "Jump to Mark" } )
map("n", "<leader>sR", function() require('fzf-lua').resume() end, { desc = "Resume" } )
map("n", "<leader>sq", function() require('fzf-lua').quickfix() end, { desc = "Quickfix List" } )
map("n", "<leader>sw", function() require('fzf-lua').grep_cword() end, { desc = "Word (Root Dir)" } )
map("n", "<leader>sW", function() require('fzf-lua').grep_cword() end, { desc = "Word (cwd)" } )
map("v", "<leader>sw", function() require('fzf-lua').grep_visual() end, { desc = "Selection (Root Dir)" } )
map("v", "<leader>sW", function() require('fzf-lua').grep_visual() end, { desc = "Selection (cwd)" } )
map("n", "<leader>ss", function() require("fzf-lua").lsp_document_symbols({ regex_filter = symbols_filter }) end, { desc = "Goto Symbol" } )
map("n", "<leader>sS", function() require("fzf-lua").lsp_live_workspace_symbols({ regex_filter = symbols_filter }) end, { desc = "Goto Symbol (Workspace)" } )

-- git ( lazygit + neogit )
map('n', "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open lazygit" })
map('n', "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
map('n', "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Neogit commit" })
map('n', "<leader>gl", "<cmd>Neogit commit<CR>", { desc = "Neogit commit" })

-- stylua: ignore end
