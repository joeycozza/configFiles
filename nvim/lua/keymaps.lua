local remap = { remap = true }
local keymap = require('./utils').keymap

keymap('n', 'dd', function()
  if vim.api.nvim_get_current_line():match('^%s*$') then
    return '"_dd'
  else
    return 'dd'
  end
end, { expr = true })

keymap('n', '<Leader>r', function()
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, { expr = true })

keymap('n', '<Leader>ni', '<cmd>lua require(\'utils\').npmInfo()<CR>')


-- add comma to end of line and put cursor back where it was
keymap('n', ',,', 'm`A,<Esc>``')
-- remove last character from line and put cursor back where it was
keymap('n', '::', 'm`$x<Esc>``')

-- mode selection (or line) up or down
keymap('n', '<c-j>', ':m .+1<CR>==')
keymap('n', '<c-k>', ':m .-2<CR>==')
keymap('i', '<c-j>', '<Esc>:m .+1<CR>==gi')
keymap('i', '<c-k>', '<Esc>:m .-2<CR>==gi')
keymap('v', '<c-j>', ':m \'>+1<CR>gv=gv')
keymap('v', '<c-k>', ':m \'<-2<CR>gv=gv')

keymap('n', '<Leader>d', ':bdelete<CR>')
keymap('n', '<Leader><Leader>d', ':bdelete!<CR>')
keymap('t', '<Leader><Leader>d', '<c-\\><c-n>:bdelete!<CR>')

keymap('i', 'jk', '<Esc>:w<CR>')

-- Leader tab and Leader \ for moving between buffers (nice for my ergodox keyboard)
keymap('n', '<Leader><Tab>', ':bprevious<CR>')
keymap('n', '<Leader>\\', ':bnext<CR>')

-- this will replace the current word with the last thing yanked. Can be
-- repeated without fear of overriding the last yanked thing
-- delete into blackhole register, then paste 0 register (last yanked item)
keymap('n', '<Leader>v', '"_diw"0P')

-- Fugitive remappings for ease of use
keymap('n', '<Leader>gs', ':Git<CR>')
keymap('n', '<Leader>gb', ':Git blame<CR>')

-- move to next or previous gittable chunk change in file
keymap('n', '<Leader>hn', '<Plug>(GitGutterNextHunk)', remap)
keymap('n', '<Leader>hp', '<Plug>(GitGutterPrevHunk)', remap)

-- who needs EX mode? last macro with Q
keymap('n', 'Q', '@@')

-- LocationList navigation
keymap('n', '<Up>', ':lopen<CR>')
keymap('n', '<Down>', ':lclose<CR>')
keymap('n', '<Left>', ':lprev<CR>')
keymap('n', '<Right>', ':lnext<CR>')

keymap('n', '<Leader><Leader><Down>', ':resize -5<CR>')
keymap('n', '<Leader><Leader><Up>', ':resize +5<CR>')
keymap('n', '<Leader><Leader><Right>', ':vertical resize +5<CR>')
keymap('n', '<Leader><Leader><Left>', ':vertical resize -5<CR>')

keymap('n', '<Leader>p', ':lua vim.lsp.buf.format()<CR>')
keymap('n', '<Leader><Leader>json',
    ':enew<CR>:file scratchTrash.json<CR>p:set filetype=json<CR>:lua vim.lsp.buf.format()<CR>',
    remap)

-- Help with terminal mode. Esc will now go back to normal mode
-- if you NEED Esc to go to the terminal, do Ctrl-v and Esc, Verbatim Escape
keymap('t', '<Esc>', '<C-\\><C-n>')
keymap('t', '<C-v><Esc>', '<Esc>')

keymap('n', '<Leader>t', ':term<CR>a')
keymap('n', '<Leader>tr', ':term node %<CR>')

-- convenience for editing and sourcing .vimrc file
keymap('n', '<Leader>ev', ':edit $MYVIMRC<CR>')

-- jest
keymap('n', '<Leader>jw', ':split | terminal ./node_modules/.bin/jest --watchAll<CR>')
