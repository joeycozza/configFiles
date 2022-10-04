local utils = require('utils')
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
