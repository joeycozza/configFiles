require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'typescript', 'javascript', 'lua', 'bash', 'vim', 'comment', 'css', 'go', 'graphql', 'html',
    'http', 'java', 'jsdoc', 'json', 'json5', 'make', 'markdown', 'markdown_inline', 'ocaml',
    'python', 'regex', 'yaml'
  },
  highlight = { enable = true, additional_vim_regex_highlighting = false }
}
