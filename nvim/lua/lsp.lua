local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                   .make_client_capabilities())

require('typescript').setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    capabilities = capabilities,
    init_options = { preferences = { disableSuggestions = true } },
    on_attach = function()
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
      vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, { buffer = 0 })
      vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, { buffer = 0 })
    end
  }
})
