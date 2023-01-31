vim.opt.termguicolors = true

return {
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
