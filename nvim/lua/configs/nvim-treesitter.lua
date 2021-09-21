require'nvim-treesitter.configs'.setup {
  ensure_installed = {'typescript', 'javascript', 'lua', 'bash', 'vim'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
    additional_vim_regex_highlighting= false,
  },
}
