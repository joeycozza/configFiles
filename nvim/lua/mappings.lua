
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>f', '<cmd>Telescope find_files hidden=true<CR>')
map('n', '<leader>tn', '<cmd>Telescope file_browser<CR>')
map('n', '<leader>tg', ":lua require('telescope.builtin').live_grep({previewer = false})<cr>")

-- add comma to end of line and put cursor back where it was
map('n', ',,', 'm`A,<Esc>``m`')
-- remove last character from line and put cursor back where it was
map('n', '::', 'm`$x<Esc>``m`')

-- mode selection (or line) up or down
map('n', '<c-j>', ':m .+1<CR>==')
map('n', '<c-k>', ':m .-2<CR>==')
map('i', '<c-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<c-k>', '<Esc>:m .-2<CR>==gi')
map('v', '<c-j>', ":m '>+1<CR>gv=gv")
map('v', '<c-k>', ":m '<-2<CR>gv=gv")

map('n', '<Leader>d', ':bdelete<CR>')
map('n', '<Leader><Leader>d', ':bdelete!<CR>')
map('t', '<Leader><Leader>d', '<c-\\><c-n>:bdelete!<CR>')

map('i', 'jk', '<Esc>:w<CR>')

-- leader tab and leader \ for moving between buffers (nice for my ergodox keyboard)
map('n', '<Leader><Tab>', ':bprevious<CR>')
map('n', '<Leader>\\', ':bnext<CR>')
