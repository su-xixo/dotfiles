local M = {}

M.get_plugin = function(name)
  return require("lazy.core.config").spec.plugins[name]
end

M.has = function(name)
  return M.get_plugin(name) ~= nil
end

return M
