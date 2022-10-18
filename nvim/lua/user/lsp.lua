local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function lsp_highlight_document( client )
  -- Set autocommands conditional on server_capabilities
  -- print(vim.notify(vim.inspect(capabilities.textDocument.documentHighlight)))
  -- print(vim.notify(vim.inspect(client.server_capabilities)))
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=240
      hi LspReferenceText cterm=bold ctermbg=240
      hi LspReferenceWrite cterm=bold ctermbg=240
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local function onAttach( client )
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, { buffer = 0 })

  lsp_highlight_document(client)
end

require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  init_options = { preferences = { disableSuggestions = true } },
  on_attach = onAttach
})

require('lspconfig').jsonls.setup({ capabilities = capabilities, on_attach = onAttach })

require('lspconfig').yamlls.setup({ capabilities = capabilities, on_attach = onAttach })

require('lspconfig').sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = onAttach,
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
})
