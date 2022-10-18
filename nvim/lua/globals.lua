local g = vim.g

g.mapleader=' '

-- speed up python executable finding, and fix issue with not finding python3 correctly
g.python_host_prog  = '/usr/bin/python'
g.python3_host_prog = '/usr/local/bin/python3'

-- turn off the git branch info since it is in terminal status bar already
g.airline_section_b = ''

g.airline_theme = 'simple'

g['airline#extensions#obsession#enabled'] = 1
g['airline#extensions#obsession#indicator_text'] = 'Obsessed'

g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#buffer_idx_mode'] = 1
g['airline#extensions#tabline#formatter'] = 'unique_tail'
g['airline#extensions#tabline#ignore_bufadd_pat'] = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler' -- dont exclude term:// from buffer tablist

g.matchup_matchparen_hi_surround_always = 1

g.UltiSnipsExpandTrigger = ';;'
g.UltiSnipsJumpForwardTrigger = ';;'
g.UltiSnipsJumpBackwardTrigger = '::'

g.used_javascript_libs = 'underscore,chai,react'

g.vim_markdown_preview_github = 1
g.vim_markdown_preview_browser = 'Google Chrome'

g.jsx_ext_required = 0

g.closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.mdx,*.md'

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
