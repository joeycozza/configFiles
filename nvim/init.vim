
lua require('plugins')

if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

"///////////////////Defaulting Registers////////////////////////////////////
let @c = '0ciwconstjkj'    " @c macro for changing a variable definition to const
"///////////////////////End Defaulting Registers/////////////////////////////

filetype plugin on

set foldtext=FoldText()

set updatetime=250
set noswapfile

set undofile                 "Save undo's after file closes
set undodir=$HOME/.vim/undo  "Where to save undo histories
set undolevels=1000          "How many undos
set undoreload=1000          "number of lines to save for undo

set clipboard=unnamed "copy to system clipboard

" setting the clipboard variable manually as per this reddit post
" https://www.reddit.com/r/neovim/comments/ab01n8/improve_neovim_startup_by_60ms_for_free_on_macos/
" This reduced my nvim startup time by about 40ms
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }

set nofixendofline

"-----------------------------------------------
" --------------Remapping Keys------------------
"  ---------------------------------------------

lua require('commands')
lua require('globals')
lua require('options')
lua require('mappings')
lua require('autocommands')

" Format json
vnoremap <Leader><Leader>j :'<,'>!python $CONFIG_FILES_PATH/jsonTool.py<CR><Paste>:set nopaste<CR>
nnoremap <Leader><Leader>json :enew<CR>:file scratchTrash.json<CR>p:set filetype=json<CR>:CocCommand prettier.formatFile<CR>

"convenience for editing and sourcing .vimrc file
nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" use tab/shift-tab to forward/backward cycle completion list
inoremap <expr> <Tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"
" Use Enter to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use Enter to confirm first option if no option is chosen
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" S to split under cursor, remove trailing whitespace on first line, and auto indent second line
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

nnoremap <Leader>t :term<CR>a
nnoremap <Leader>tr :term node %<CR>
" -----------------------------------------------------
" Plugin settings
" -----------------------------------------------------

let g:matchup_matchparen_deferred=1
let g:matchup_matchparen_hi_surround_always=1
let g:matchup_matchparen_offscreen={'method': 'popup'}

let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\~$', '\.swp$', '^\.git$', '^\.DS_Store$']
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" turn off the git branch info since it is in terminal status bar already
let g:airline_section_b = ''

" You should know that some variable names in vimscript are not valid in lua. We still have access to them but we can't use the dot notation. For example, vim-zoom has a variable called zoom#statustext and in vimscript we use it like this.
" let g:zoom#statustext = 'Z'
" In lua we would have to do this.
" vim.g['zoom#statustext'] = 'Z'
let g:airline_theme='simple'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = 'Obsessed'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler' "dont exclude term:// from buffer tablist

let g:tern#is_show_argument_hints_enabled=1

let g:used_javascript_libs = 'underscore,chai,react'

let g:UltiSnipsExpandTrigger = ';;'
let g:UltiSnipsJumpForwardTrigger = ';;'
let g:UltiSnipsJumpBackwardTrigger = '::'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']

let g:vim_markdown_preview_github = 1
let g:vim_markdown_preview_browser = 'Google Chrome'

let g:jsx_ext_required = 0

let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.mdx,*.md'

"************************************************************************************************
"**************END PLUGIN SETTINGS***************************************************************
"************************************************************************************************

" Help with terminal mode. Esc will now go back to normal mode
" if you NEED Esc to go to the terminal, do Ctrl-v and Esc, Verbatim Escape
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15

" Improved Vim fold-text
function! FoldText()
	" Get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = ' ' . foldSize . ' lines '
	let foldLevelStr = ' foldLevel:' . v:foldlevel
	" let foldLevelStr = repeat('+--', v:foldlevel)
	let lineCount = line('$')
	let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
	let expansionString = repeat(' ', w - strwidth(line.foldSizeStr.foldPercentage.foldLevelStr))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

lua << EOF
require('telescope').setup{
  defaults = require('configs/telescope')
}
EOF
