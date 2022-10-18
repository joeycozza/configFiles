local treesitterConfigs = require('nvim-treesitter.configs')
local keymap = require('../utils').keymap

treesitterConfigs.setup({
  ensure_installed = {
    'typescript', 'javascript', 'lua', 'bash', 'vim', 'comment', 'css', 'go', 'graphql', 'html',
    'http', 'java', 'jsdoc', 'json', 'json5', 'make', 'markdown', 'markdown_inline', 'ocaml',
    'python', 'regex', 'yaml'
  },
  highlight = { enable = true, additional_vim_regex_highlighting = false }
})

keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>')
keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>')
keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>')
keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
