vim.opt.termguicolors = true

return {

  {
    'nvim-neo-tree/neo-tree.nvim',
    keys = {
      { '<Leader>nt', ':Neotree toggle reveal<CR>', desc = 'Toggle neo-tree' },
      { '<Leader>ng', ':Neotree git_status float<CR>', desc = 'Show neo-tree git status' }
    },
    opts = {
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
  }, {
    'folke/trouble.nvim',
    keys = {
      {
        '<Leader><Up>',
        ':Trouble workspace_diagnostics<CR>',
        desc = 'Leader Up to open Workspace Diagnostics'
      }, { '<Up>', ':Trouble document_diagnostics<CR>', desc = 'Up to open Document Diagnostics' },
      { '<Down>', ':TroubleClose<CR>', desc = 'Down to close Trouble' }, {
        '<Left>',
        '<cmd>lua require(\'trouble\').previous({skip_groups = true, jump = true})<CR>',
        desc = 'Left to go to previous Trouble item'
      }, {
        '<Right>',
        '<cmd>lua require(\'trouble\').next({skip_groups = true, jump = true})<CR>',
        desc = 'Right to go to next Trouble item'
      }
    }
  }, { 'yuttie/comfortable-motion.vim', event = 'VeryLazy' },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    dependencies = { { 'ggandor/flit.nvim', opts = { labeled_modes = 'nv' } } }
  }, {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      -- Leader tab and Leader \ for cycling between buffers (nice for my ergodox keyboard)
      { '<Leader><Tab>', ':BufferLineCyclePrev<CR>', desc = 'Cycle left 1 buffer' },
      { '<Leader>\\', ':BufferLineCycleNext<CR>', desc = 'Cycle right 1 buffer' },
      -- LeaderLeader tab and LeaderLeader \ for moving buffers in Bufferline (nice for my ergodox keyboard)
      { '<Leader><Leader><Tab>', ':BufferLineMovePrev<CR>', desc = 'Move cur buffer 1 to the left' },
      { '<Leader><Leader>\\', ':BufferLineMoveNext<CR>', desc = 'Move cur buffer 1 to the right' }
    },
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        show_buffer_close_icons = false,
        separator_style = 'slant',
        hover = { enabled = false }
      }
    }

  }

}
