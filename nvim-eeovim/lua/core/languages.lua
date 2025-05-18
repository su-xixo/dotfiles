local H = {}
H.treesitter = {
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "rust",
  "toml",
  "vim",
  "vimdoc",
}

H.lsp = { "lua_ls", "bashls", "pylsp", "ruff" }
H.linter = {}
H.fmt = { "stylua", "shfmt", "prettierd", "prettier" }
H.dap = {}
return H
