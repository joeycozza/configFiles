local jester = require('jester')
local keymap = require('utils').keymap

jester.setup({
  path_to_jest = './node_modules/.bin/jest',
  terminal_cmd = ':lua require\'FTerm\'.run(\'\')'
})

keymap('n', '<Leader>js', ':lua require("jester").run()<CR>')
keymap('n', '<Leader>jf', ':lua require("jester").run_file()<CR>')
keymap('n', '<Leader>jl', ':lua require("jester").run_last()<CR>')
