return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        prettier = {
          prepend_args = { "--semi=false", "--print-width=120", "--single-quote", "--trailing-comma=es5" },
        },
      },
    },
  },
}
