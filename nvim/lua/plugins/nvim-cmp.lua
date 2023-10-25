local cmp = require("cmp")
return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
    },
  },
}
