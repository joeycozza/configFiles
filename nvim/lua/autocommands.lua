local nvimCmd = vim.api.nvim_command

-- This fixes my cursor the way I like it in the terminal after quitting vim
nvimCmd('autocmd VimLeave * set guicursor=a:ver10-blinkon0')

nvimCmd('autocmd FileType json syntax match Comment +\\/\\/.\\+$+')
