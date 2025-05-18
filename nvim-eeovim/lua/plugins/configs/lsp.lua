local H = {}
local map = vim.keymap.set

H.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
end

H.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

H.capabilities = vim.lsp.protocol.make_client_capabilities()

H.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

H.servers = {
  lua_ls = {
    Lua = {
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
      },
    },
  },
}

H.backword_compatible = function ()
  require("lspconfig").lua_ls.setup {
    capabilities = H.capabilities,
    on_init = H.on_init,
    settings = H.servers.lua_ls,
  }
end

H.default = function ()
  -- vim.api.nvim_create_autocmd("LspAttach", {
  --   callback = function(args)
  --     H.on_attach(_, args.buf)
  --   end,
  -- })

  vim.lsp.config("*", { capabilities = H.capabilities, on_init = H.on_init })
  vim.lsp.config("lua_ls", { settings = H.servers.lua_ls })
  vim.lsp.enable(vim.tbl_keys(H.servers))
end

return H
