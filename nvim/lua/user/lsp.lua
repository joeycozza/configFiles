local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig')['tsserver'].setup({
  capabilities = capabilities,
  init_options = { preferences = { disableSuggestions = true } },
  on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, { buffer = 0 })
  end
})
