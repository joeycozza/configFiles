local neotree = require('neo-tree')
local keymap = require('../utils').keymap

local config = {
  add_blank_line_at_top = true,
  enable_modified_markers = true, -- Show markers for files with unsaved changes.
  popup_border_style = 'double', -- "double", "none", "rounded", "shadow", "single" or "solid"
  event_handlers = {
    {
      event = 'file_opened',
      handler = function()
        require('neo-tree').close_all()
      end
    }
  },
  default_component_configs = {
    modified = { symbol = '[+] ', highlight = 'NeoTreeModified' },
    name = { trailing_slash = true, use_git_status_colors = true, highlight = 'NeoTreeFileName' },
    git_status = { symbols = { modified = '+' } }
  },
  filesystem = {
    filtered_items = { never_show = { '.DS_Store', 'Session.vim' } },
    find_by_full_path_words = false -- `false` means it only searches the tail of a path.
  }
}

neotree.setup(config)

keymap('n', '<Leader>nt', ':Neotree toggle reveal<CR>')
keymap('n', '<Leader>ng', ':Neotree git_status float<CR>')
