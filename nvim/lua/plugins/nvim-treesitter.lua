return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "styled",
        "css",
        "git_config",
        "gitignore",
        "graphql",
        "markdown_inline",
      })
    end,
  },
}
