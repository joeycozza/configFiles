local keymap = require('utils').keymap
local trouble = require('trouble')

trouble.setup({})

keymap('n', '<Up>', ':Trouble document_diagnostics<CR>')
keymap('n', '<Down>', ':TroubleClose<CR>')
keymap('n', '<Left>', '<cmd>lua require(\'trouble\').previous({skip_groups = true, jump = true})<CR>')
keymap('n', '<Right>', '<cmd>lua require(\'trouble\').next({skip_groups = true, jump = true})<CR>')
