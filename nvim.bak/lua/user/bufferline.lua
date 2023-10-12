local utils = require('utils')
local keymap = utils.keymap
local bufferline = require('bufferline')

vim.opt.termguicolors = true

bufferline.setup({
  options = {
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    show_buffer_close_icons = false,
    separator_style = 'slant',
    hover = { enabled = false }
  }
})


-- Leader tab and Leader \ for cycling between buffers (nice for my ergodox keyboard)
keymap('n', '<Leader><Tab>', ':BufferLineCyclePrev<CR>')
keymap('n', '<Leader>\\', ':BufferLineCycleNext<CR>')
-- LeaderLeader tab and LeaderLeader \ for moving buffers in Bufferline (nice for my ergodox keyboard)
keymap('n', '<Leader><Leader><Tab>', ':BufferLineMovePrev<CR>')
keymap('n', '<Leader><Leader>\\', ':BufferLineMoveNext<CR>')
