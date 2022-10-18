local utils = require('utils')
local keymap = utils.keymap
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup({
  defaults = {
    sorting_strategy = 'descending',
    prompt_prefix = '🔍 ',
    selection_caret = '->',
    layout_strategy = 'vertical',
    layout_config = { width = 0.95, preview_width = 0.55, prompt_position = 'bottom' },
    file_ignore_patterns = { 'dist/index.js', '.git/.*' },
    dynamic_preview_title = true,
    color_devicons = true,
    path_display = utils.smartTruncate,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    mappings = { i = { ['<esc>'] = actions.close } },
    preview = { filesize_limit = 5, timeout = 100 }
  }
})

telescope.load_extension('fzf')

keymap('n', '<Leader>f', '<cmd>Telescope find_files hidden=true<CR>')
-- grep in the entire project
keymap('n', '<Leader>tg', ':Telescope live_grep<CR>')
keymap('n', '<Leader>ts', ':Telescope treesitter<CR>')
keymap('n', '<Leader>tb', ':Telescope git_bcommits<CR>')
-- grep in the entire project but start with the string under cursor and then include filename in the fuzzy finding
keymap('n', '<Leader><Leader>tg', ':Telescope grep_string<CR>')
