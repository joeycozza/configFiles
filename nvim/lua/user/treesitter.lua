local treesitterConfigs = require('nvim-treesitter.configs')
local keymap = require('../utils').keymap

treesitterConfigs.setup({
  ensure_installed = {
    'typescript', 'javascript', 'lua', 'bash', 'vim', 'comment', 'css', 'go', 'graphql', 'html',
    'http', 'java', 'jsdoc', 'json', 'json5', 'make', 'markdown', 'markdown_inline', 'ocaml',
    'python', 'regex', 'yaml', 'vimdoc', 'query'
  },
  sync_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>'
    }
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = { ['af'] = '@function.outer', ['if'] = '@function.inner' }
    },
    swap = {
      enable = true,
      swap_next = { ['<Leader>a'] = '@parameter.inner' },
      swap_previous = { ['<Leader>A'] = '@parameter.inner' }
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        -- go peek
        -- users/lsp.lua has gt for go to type_definition
        ['gp'] = '@function.outer'
      }
    }
  }
})

keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>')
keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>')
keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>')
keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
