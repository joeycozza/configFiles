local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.lua_format, formatting.prettier.with({
      filetypes = {
        'javascript', 'json', 'yaml', 'markdown', 'typescript', 'javascriptreact', 'typescript',
        'typescriptreact'
      },
      extra_args = {
        '--arrow-parens=always', '--print-width=120', '--trailing-comma=es5', '--no-semi',
        '--single-quote'
      }
    }), diagnostics.eslint, diagnostics.vint, diagnostics.zsh
  }
})
