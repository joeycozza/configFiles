local utils = require('utils')
local keymap = utils.keymap
local telescope = require('telescope')
local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    prompt_prefix = '🔍 ',
    selection_caret = '->',
    layout_strategy = 'vertical',
    layout_config = { mirror = true, width = 0.95, preview_width = 0.55, prompt_position = 'top' },
    file_ignore_patterns = { 'dist/index.js', '.git/.*' },
    dynamic_preview_title = true,
    color_devicons = true,
    path_display = utils.smartTruncate,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    mappings = {
      i = { ['<esc>'] = actions.close, ['<c-t>'] = trouble.open_with_trouble },
      n = { ['<c-t>'] = trouble.open_with_trouble }
    },
    preview = { filesize_limit = 3, timeout = 100 }
  }
})

telescope.load_extension('fzf')

keymap('n', '<Leader>f', '<cmd>Telescope find_files hidden=true<CR>')
keymap('n', '<Leader>ts', ':Telescope treesitter<CR>')
keymap('n', '<Leader>tb', ':Telescope git_bcommits<CR>')
keymap('n', '<Leader>td', ':Telescope diagnostics<CR>')
-- grep in the entire project
keymap('n', '<Leader>tg', ':Telescope live_grep<CR>')
-- grep in the entire project but start with the string under cursor and then include filename in the fuzzy finding
keymap('n', '<Leader><Leader>tg', ':Telescope grep_string<CR>')
