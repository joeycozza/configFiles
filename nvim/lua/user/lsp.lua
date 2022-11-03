local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.diagnostic.config({ virtual_text = false })

local function onAttach()
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, { buffer = 0 })
  vim.api.nvim_command(
    'autocmd CursorHold <buffer> lua vim.diagnostic.open_float({scope = "cursor", source = true}, {focus=false})')
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

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"/", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"\\", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"/", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"\\", "FloatBorder"},
      {"▏", "FloatBorder"},
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
