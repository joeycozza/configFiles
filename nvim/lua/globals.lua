local g = vim.g

g.mapleader=' '

-- speed up python executable finding, and fix issue with not finding python3 correctly
g.python_host_prog  = '/usr/bin/python'
g.python3_host_prog = '/usr/local/bin/python3'

-- turn off the git branch info since it is in terminal status bar already
g.airline_section_b = ''

g.airline_theme = 'simple'

g['airline#extensions#ale#enabled'] = 1

g['airline#extensions#obsession#enabled'] = 1
g['airline#extensions#obsession#indicator_text'] = 'Obsessed'

g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#buffer_idx_mode'] = 1
g['airline#extensions#tabline#formatter'] = 'unique_tail'
g['airline#extensions#tabline#ignore_bufadd_pat'] = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler' -- dont exclude term:// from buffer tablist

g.matchup_matchparen_hi_surround_always = 1

g.ale_fix_on_save = 0
g.ale_lint_on_save = 1
g.ale_lint_on_text_changed = 'never'
g.ale_javascript_prettier_options = '--trailing-comma=es5 --no-semi --single-quote --print-width=120'

g.UltiSnipsExpandTrigger = ';;'
g.UltiSnipsJumpForwardTrigger = ';;'
g.UltiSnipsJumpBackwardTrigger = '::'

g.NERDTreeShowBookmarks = 1
g.NERDTreeAutoDeleteBuffer = 1
g.NERDTreeChDirMode = 0
g.NERDTreeQuitOnOpen = 1
g.NERDTreeMouseMode = 2
g.NERDTreeShowHidden = 1
g.NERDTreeKeepTreeInNewTab = 1
g.nerdtree_tabs_open_on_gui_startup = 0

g['tern#is_show_argument_hints_enabled'] = 1

g.used_javascript_libs = 'underscore,chai,react'

g.vim_markdown_preview_github = 1
g.vim_markdown_preview_browser = 'Google Chrome'

g.jsx_ext_required = 0

g.closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.mdx,*.md'
