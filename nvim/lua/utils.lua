local M = {}

M.get_plugin = function(name)
  return require("lazy.core.config").spec.plugins[name]
end

M.has = function(name)
  return M.get_plugin(name) ~= nil
end

M.opts = function(name)
  local plugin = M.get_plugin(name)
  if plugin == nil then
    return {}
  end
  local Plugin = require "lazy.core.plugin"
  return Plugin.values(plugin, "opts", false)
end
return M
