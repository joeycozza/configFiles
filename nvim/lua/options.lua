local opt = vim.opt

-- https://github.com/neoclide/coc.nvim#example-vim-configuration
-- Some servers have issues with backup files, see #649
opt.backup = false
opt.writebackup = false
opt.cmdheight = 5

-- Normally Vim rerenders the screen after every step of the macro, which looks weird and slows the execution down.
-- With this change it only rerenders at the end of the macro.
opt.lazyredraw = true

opt.ignorecase = true
opt.smartcase = true

opt.whichwrap  ='b,s,h,l,<,>,[,]'  -- Backspace and cursor keys wrap too

opt.foldmethod = 'syntax'  -- vim-javascript can take advantage of syntax to fold smarter
opt.foldenable = false      -- when opening a file, dont start with any folding
opt.foldnestmax = 10
opt.foldlevel = 10
