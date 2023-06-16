local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.lua_format,
    formatting.prettier
      .with({ extra_args = {'--arrow-parens=always', '--print-width=120', '--no-semi', '--single-quote', '--trailing-comma=es5' } }),
    diagnostics.eslint, diagnostics.vint, diagnostics.zsh
  }
})
