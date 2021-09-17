local utils = require('utils')
local actions = require('telescope.actions')

local telescopeConfig = {
  vimgrep_arguments = {
    'rg',
    '--line-number',
    '--no-heading',
    '--fixed-strings',
    '--color=never',
    '--with-filename',
    '--smart-case',
    '--column'
  },
  selection_strategy = "reset",
  sorting_strategy = "ascending",
  layout_strategy = "horizontal",
  prompt_prefix = "🔍 ",
  layout_config = {
    width = 0.90,
    preview_width = 0.60,
    prompt_position = "top",
  },
  file_ignore_patterns = {
    ".git/.*"
  },
  color_devicons = true,
  use_less = true,
  path_display = utils.smartTruncate,
  set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
  grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
  qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  mappings = {
    i = {
      ["<esc>"] = actions.close
    }
  }
}

return telescopeConfig
