-- local keymaps = vim.api.nvim_get_keymap "n"
-- vim.print(#keymaps)
-- vim.print(vim
--   .iter(keymaps)
--   :filter(function(item)
--     -- return string.find(item.desc or "", "LazyGit")
--     local desc = item.desc
--     local pattern = "find"
--     return desc and desc:lower():find(pattern:lower())
--   end)
--   :totable())

local get_key_table = function(key, pattern, mode)
  mode = mode or "n"
  local K = {}
  local keymaps = vim.api.nvim_get_keymap(mode)
  K.key_table = vim
    .iter(keymaps)
    :filter(function(item)
      -- return string.find(item.desc or "", "LazyGit")
      if item[key] == nil then
        -- vim.print(item[key])
        return
      end
      local data = item[key]
      return data and data:lower():find(pattern:lower())
    end)
    :totable()

  -- local clean_map = function()
  --   -- like: { "", "", mode=..., desc=... }
  --   --
  -- end

  K.len = #K.key_table
  return K.key_table, K.len
end

local tbl, len = get_key_table("lhs", " f")
vim.print(tbl, len)

-- local s = "helloHello"
-- local l = s:lower()
-- print(l)
