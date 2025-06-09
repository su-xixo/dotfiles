-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",
  integrations = {
    "blankline",
    "cmp",
    "codeactionmenu",
    "dap",
    "devicons",
    "hop",
    "lsp",
    "markview",
    "mason",
    "neogit",
    "notify",
    "nvimtree",
    "rainbowdelimiters",
    "semantic_tokens",
    "todo",
    "whichkey",
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "     Powered By  eovim    ",
    "                            ",
  },
  buttons = {
    --stylua: ignore start
    { txt = "  Find File", keys = "ff", cmd = "FzfLua files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    { txt = "  Restore Session", keys = "sr", cmd = ":lua require('persistence').load()" },
    { txt = "󱁤  Mason", keys = "om", cmd = "Mason" },
    { txt = "󰒲  Lazy", keys = "ol", cmd = "Lazy" },
    { txt = "  Quit", keys = "q", cmd = ":lua vim.api.nvim_command('qa')" },
    -- { txt = "  Quit", keys = "q", cmd = ":lua vim.cmd('q')" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    -- stylua: ignore end
  },
}
M.ui = {
  telescope = { style = "bordered" },
  -- tabufline = {
  --   lazyload = false,
  -- },
}

return M
