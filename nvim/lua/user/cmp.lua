local cmp = require('cmp')

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  print('lspkind was NOT found')
  return
end

lspkind.init()

cmp.setup({
  snippet = {
    expand = function( args )
      vim.fn['UltiSnips#Anon'](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, { name = 'path' }, { name = 'ultisnips' }, { name = 'nvim_lua' },
    { name = 'buffer', keyword_length = 4 }
  }),
  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        ultisnips = "[snip]"
      },
    }),
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  }
})

