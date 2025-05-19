local blink = require("blink.cmp")
local options = {
  cmdline = {
    keymap = {
      preset = "cmdline",
      -- -- default cmdline
      -- ['<Tab>'] = { 'show_and_insert', 'select_next' },
      -- ['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
      --
      -- ['<C-space>'] = { 'show', 'fallback' },
      --
      -- ['<C-n>'] = { 'select_next', 'fallback' },
      -- ['<C-p>'] = { 'select_prev', 'fallback' },
      -- ['<Right>'] = { 'select_next', 'fallback' },
      -- ['<Left>'] = { 'select_prev', 'fallback' },
      --
      -- ['<C-y>'] = { 'select_and_accept' },
      -- ['<C-e>'] = { 'cancel' },
      -- --
    },
    completion = { menu = { auto_show = false } },
  },
  completion = {
    keyword = { range = "full" },
    trigger = {
      show_on_insert_on_trigger_character = true,
      show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", "[" },
    },
    list = {
      selection = { preselect = true, auto_insert = false },
      cycle = { from_bottom = true, from_top = true },
    }, -- <C-e> close menu + undo preview, <C-space> show menu
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = {
      "select_next",
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    -- -- default comp keymap
    -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    -- ['<C-e>'] = { 'hide' },
    -- ['<C-y>'] = { 'select_and_accept' },
    --
    -- ['<Up>'] = { 'select_prev', 'fallback' },
    -- ['<Down>'] = { 'select_next', 'fallback' },
    -- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    -- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
    --
    -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    --
    -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
    -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    --
    -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    -- --
  },
  signature = {
    enabled = true,
    trigger = {
      enabled = false,
    },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
}

blink.setup(options)
