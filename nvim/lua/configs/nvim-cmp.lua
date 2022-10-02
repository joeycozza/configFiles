local cmp = require('cmp')

local nvimCmpConfig = {
  sources = cmp.config.sources({
    { name = 'nvim-lsp' },
    { name = 'path' },
    { name = 'ultisnips' },
    { name = 'nvim-lua' },
    { name = 'buffer', keyword_length = 4 },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
  }),
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  experimental = {
    native_menu = false
  }

}

return nvimCmpConfig 
