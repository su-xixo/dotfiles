local H = {}
H.active  = {}
H.active.manager = {
  { "<leader>ol", "<cmd>Lazy<CR>", desc = "Lazy plugin manager" },
  { "<leader>om", "<cmd>Mason<CR>", desc = "Open mason manager" },
}

H.active.tree = {
  { "<leader>E", "<cmd>NvimTreeToggle<CR>", desc = "nvimtree toggle window" },
  { "<C-n>", "<cmd>NvimTreeFocus<CR>", desc = "nvimtree focus window" },
  { "<leader>e", function ()
    if not require("mini.files").close() then
      require("mini.files").open()
    end
  end, desc = "Mini file explorer" }
}

H.nvchad = {
  { "<C-b>", "<ESC>^i", desc = "move beginning of line", mode = "i" },
  { "<C-e>", "<End>", desc = "move end of line", mode = "i" },
  { "<C-h>", "<Left>", desc = "move left", mode = "i" },
  { "<C-l>", "<Right>", desc = "move right", mode = "i" },
  { "<C-j>", "<Down>", desc = "move down", mode = "i" },
  { "<C-k>", "<Up>", desc = "move up", mode = "i" },

  { "<C-h>", "<C-w>h", desc = "switch window left" },
  { "<C-l>", "<C-w>l", desc = "switch window right" },
  { "<C-j>", "<C-w>j", desc = "switch window down" },
  { "<C-k>", "<C-w>k", desc = "switch window up" },

  { "<Esc>", "<cmd>noh<CR>", desc = "general clear highlights" },

  { "<C-s>", "<cmd>w<CR>", desc = "general save file" },
  { "<C-c>", "<cmd>%y+<CR>", desc = "general copy whole file" },

  { "<leader>n", "<cmd>set nu!<CR>", desc = "toggle line number" },
  { "<leader>rn", "<cmd>set rnu!<CR>", desc = "toggle relative number" },
  { "<leader>ch", "<cmd>NvCheatsheet<CR>", desc = "toggle nvcheatsheet" },
  -- Comment
  { "<leader>/", "gcc", desc = "toggle comment", remap = true  },
  { "<leader>/", "gc", desc = "toggle comment", mode = "v", remap = true  },

  -- tabufline
  { "<leader>b", "<cmd>enew<CR>", desc = "buffer new" },
  { "<tab>", function() require("nvchad.tabufline").next() end, desc = "buffer goto next" },
  { "<S-tab>", function() require("nvchad.tabufline").prev() end, desc = "buffer goto prev" },
  { "<leader>x", function() require("nvchad.tabufline").close_buffer() end, desc = "buffer close" },
  { "<leader>th", function() require("nvchad.themes").open() end, desc = "telescope nvchad themes" },

  -- terminal
  { "<C-x>", "<C-\\><C-N>", desc = "terminal escape terminal mode" },

  -- new terminals
  { "<leader>h", function() require("nvchad.term").new { pos = "sp" } end, desc = "terminal new horizontal term" },
  { "<leader>v", function() require("nvchad.term").new { pos = "vsp" } end, desc = "terminal new vertical term" },

  -- toggleable
  { "<A-v>", function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" } end, mode = { "n", "t" }, desc = "terminal toggleable vertical term" },
  { "<A-h>", function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end, mode = { "n", "t" }, desc = "terminal toggleable horizontal term" },
  { "<A-i>", function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" } end, mode = { "n", "t" }, desc = "terminal toggle floating term" },
}

H.fzf_lua = {
  { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
  { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
  { "<leader>fr", "<cmd>FzfLua resume<CR>", desc = "Resume finding" },
  { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Find help" },
  { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Find oldfiles" },
  { "<leader>fd", "<cmd>FzfLua lsp_document_diagnostics<CR>", desc = "Find current diagnostic" },
  { "<leader>fD", "<cmd>FzfLua lsp_workspace_diagnostics<CR>", desc = "Find all diagnostic" },
  { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Grep live whole project" },
  { "<leader>/", "<cmd>FzfLua blines<CR>", desc = "Grep live in current buffer" },
  { "<leader>fB", "<cmd>FzfLua builtin<CR>", desc = "Find buildins" },
  {
    "<leader>Fn",
    "<cmd>FzfLua files cwd=~/.config/nvim cwd_prompt=false prompt=\\ <CR>",
    desc = "Find within neovim config",
  },
  {
    "<leader>Fd",
    "<cmd>FzfLua files cwd=~/dotfiles cwd_prompt=false prompt=󰘓\\ <CR>",
    desc = "Find within dotfiles",
  },
  {
    "<leader>Fc",
    "<cmd>FzfLua files cwd=~/.config cwd_prompt=false prompt=\\ <CR>",
    desc = "Find within config_dir",
  },
  -- fzf related
  { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "Grep current word" },
  { "<leader>fW", "<cmd>FzfLua grep_cWORD<CR>", desc = "Grep current WORD" },
}

H.pick = {
  { "<leader>ff", "<cmd>Pick files<CR>", desc = "Find files" },
  { "<leader>fb", "<cmd>Pick buffers<CR>", desc = "Find buffers" },
  { "<leader>fr", "<cmd>Pick resume<CR>", desc = "Resume finding" },
  { "<leader>fh", "<cmd>Pick help<CR>", desc = "Find help" },
  { "<leader>fo", "<cmd>Pick oldfiles<CR>", desc = "Find oldfiles" },
  { "<leader>fd", "<cmd>Pick diagnostic scope='current'<CR>", desc = "Find current diagnostic" },
  { "<leader>fD", "<cmd>Pick diagnostic scope='all'<CR>", desc = "Find all diagnostic" },
  { "<leader>fg", "<cmd>Pick grep_live<CR>", desc = "Grep live whole project" },
  { "<leader>/", "<cmd>Pick buf_lines<CR>", desc = "Grep live in current buffer" },
  { "<leader>fB", "<cmd>Pick buildins<CR>", desc = "Find buildins" },
  { "<leader>Fn", "<cmd>Pick nvim_config<CR>", desc = "Find within neovim config" },
  { "<leader>Fd", "<cmd>Pick dotfiles<CR>", desc = "Find within dotfiles" },
  { "<leader>Fc", "<cmd>Pick config_dir<CR>", desc = "Find within config_dir" },
}

H.trailspace = {
  { "<leader>ts", "<cmd>lua MiniTrailspace.trim()<CR>", desc = "Trail all spaces" },
  { "<leader>tl", "<cmd>lua MiniTrailspace.trim_last_lines()<CR>", desc = "Trail all empty lines" },
}

H.formatter = {
  {
    "<leader>mp",
    function()
      require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 1000, })
    end,
    mode = { "n", "v" },
    desc = "Format buffer"
  },
  {
    "<C-m><C-p>",
    function()
      require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 1000, })
    end,
    mode = { "i" },
    desc = "Format buffer"
  },
}

H.setmap = function(keyTable)
  keyTable = keyTable or ""
  for _, value in pairs(H[keyTable] or keyTable) do
    if type(value) == "table" and not vim.tbl_isempty(value) then
      local opts = {
        buffer = value.buffer or false,
        noremap = value.noremap or true,
        silent = value.silent or true,
        desc = value.desc or "",
      }
      vim.keymap.set(value.mode or "n", value[1], value[2], opts)
    end
  end
end
H.active_map = function ()
  for k, _ in pairs(H.active) do
    H.setmap(H.active[k])
  end
end
return H
