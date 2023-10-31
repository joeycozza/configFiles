local cmp = require("cmp")
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          local ls = require("luasnip")
          ls.config.setup({ store_selection_keys = "<Tab>" })
          local fromSnip = require("luasnip.loaders.from_snipmate")
          fromSnip.lazy_load({ paths = "./lua/snippets" })
        end,
        dependencies = {
          "rafamadriz/friendly-snippets",
          "saadparwaiz1/cmp_luasnip",
        },
      },
    },
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
