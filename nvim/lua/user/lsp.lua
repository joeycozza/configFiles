local utils = require('utils')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.diagnostic.config({ virtual_text = false })

local function diagnosticsOrLspInfo()

  local lineNum = vim.api.nvim_win_get_cursor(0)[1]
  local diagnosticsOnLine = vim.diagnostic.get(0, { lnum = lineNum - 1 })

  if not next(diagnosticsOnLine) then
    vim.lsp.buf.hover()
  else
    vim.diagnostic.open_float({ source = true }, { focus = false })
  end

end

local function onAttach()
  vim.keymap.set('n', 'K', diagnosticsOrLspInfo, { buffer = 0 })
  vim.keymap.set('n', '<Esc>', utils.closeFloatingWindows, { buffer = 0 })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, { buffer = 0 })
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

local border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview( contents, syntax, opts, ... )
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
