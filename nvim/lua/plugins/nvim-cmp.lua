local cmp = require("cmp")
local luasnip = require("luasnip")

local fromSnip = require("luasnip.loaders.from_snipmate")
fromSnip.lazy_load({ paths = { "./lua/snippets" } })

return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      experimental = {
        ghost_text = false,
      },
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
    },
    keys = {
      {
        "<tab>",
        function()
          return luasnip.jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          luasnip.jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          luasnip.jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },
}
