local g = vim.g

g.mapleader = " "

-- speed up python executable finding, and fix issue with not finding python3 correctly
g.python_host_prog = "/usr/bin/python"
g.python3_host_prog = "/opt/homebrew/bin/python3"

g.UltiSnipsExpandTrigger = ";;"
g.UltiSnipsJumpForwardTrigger = ";;"
g.UltiSnipsJumpBackwardTrigger = "::"

g.vim_markdown_preview_github = 1
g.vim_markdown_preview_browser = "Firefox"

g.jsx_ext_required = 0

g.closetag_filenames = "*.html,*.jsx,*.js,*.tsx,*.mdx,*.md"

-- basically turn off netrw completely. If you open/:e a dir, it'll just open neo-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
