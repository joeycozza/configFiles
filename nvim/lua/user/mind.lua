require('mind').setup()
local keymap = require('../utils').keymap

keymap('n', 'mom', ':MindOpenMain<CR>')
keymap('n', 'mop', ':MindOpenProject<CR>')
