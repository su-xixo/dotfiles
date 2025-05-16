local pick = require("mini.pick")
local options = {}
pick.setup(options)

pick.registry.nvim_config = function(local_opts)
  local opts = {
    source = { cwd = vim.fn.stdpath("config"), name = "Neovim Config" },
    window = { prompt_prefix = " : " },
  }
  local_opts.cwd = nil
  return pick.builtin.files(nil, opts)
end
pick.registry.dotfiles = function(local_opts)
  local opts = {
    source = { cwd = vim.fn.expand("~/dotfiles"), name = "Neovim Config" },
    window = { prompt_prefix = " : " },
  }
  local_opts.cwd = nil
  return pick.builtin.files(nil, opts)
end
pick.registry.config_dir = function(local_opts)
  local opts = {
    source = { cwd = vim.fn.expand("~/.config"), name = "Neovim Config" },
    window = { prompt_prefix = "󱞞 : " },
  }
  local_opts.cwd = nil
  return pick.builtin.files(nil, opts)
end

pick.registry.buildins = function()
  local items = vim.tbl_keys(pick.registry)
  table.sort(items)
  local source = { items = items, name = "Buildins", choose = function() end }
  local chosen_picker_name = pick.start({ source = source })
  if chosen_picker_name == nil then
    return
  end
  return pick.registry[chosen_picker_name]()
end
