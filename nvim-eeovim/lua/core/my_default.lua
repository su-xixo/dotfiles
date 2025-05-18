local H = {}
H.option = {
  events = { "BufReadPost", "BufNewFile", "BufRead" },
}
H.lang = require("core.languages")
return H
