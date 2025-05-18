local H = {}
H.option = {
  events = { "BufReadPost", "BufNewFile" },
}
H.lang = require("core.languages")
return H
