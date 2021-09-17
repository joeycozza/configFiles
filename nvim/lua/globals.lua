local g = vim.g

g.mapleader=' '

-- speed up python executable finding, and fix issue with not finding python3 correctly
g.python_host_prog  = '/usr/bin/python'
g.python3_host_prog = '/usr/local/bin/python3'
