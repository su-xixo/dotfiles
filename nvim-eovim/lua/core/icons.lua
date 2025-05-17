local H = {}
H.icons = {
  notfound = '󰱞',
  finder = "",
}
H.get_icons = function (iconKey)
  iconKey = iconKey or ''
  if vim.fn.empty(iconKey) == 1 then
    vim.print("Pass icon key...")
    return iconKey
  else
    if vim.iter(H.icons):any(function (key, _) return key == iconKey end) then
      -- vim.print(H.icons[iconKey])
      return H.icons[iconKey]
    else
      -- vim.print("󰱞")
      return H.icons.notfound
    end
  end
end
H.text_icons = {}

-- vim.print(H.get_icons())
-- vim.print(H.get_icons('finder'))
-- vim.print(H.get_icons('finr'))
return H
