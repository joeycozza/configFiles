local utils = require('utils')
local actions = require('telescope.actions')

local telescopeConfig = {
  sorting_strategy = "ascending",
  prompt_prefix = "🔍 ",
  selection_caret = "->",
  layout_strategy = "horizontal",
  layout_config = {
    width = 0.95,
    preview_width = 0.55,
    prompt_position = "top",
  },
  file_ignore_patterns = {
    ".git/.*"
  },
  dynamic_preview_title = true,
  color_devicons = true,
  path_display = utils.smartTruncate,
  set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  mappings = {
    i = {
      ["<esc>"] = actions.close
    }
  },
  preview = {
    filesize_limit= 5,
    timeout= 100
  }
}

return telescopeConfig
