lua require('plugins')
lua require('commands')
lua require('globals')
lua require('options')
lua require('mappings')
lua require('autocommands')

filetype plugin on

set foldtext=FoldText()

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

"-----------------------------------------------
" --------------Remapping Keys------------------
"  ---------------------------------------------

" Format json
vnoremap <Leader><Leader>j :'<,'>!python $CONFIG_FILES_PATH/jsonTool.py<CR><Paste>:set nopaste<CR>
nnoremap <Leader><Leader>json :enew<CR>:file scratchTrash.json<CR>p:set filetype=json<CR>:CocCommand prettier.formatFile<CR>

" use tab/shift-tab to forward/backward cycle completion list
inoremap <expr> <Tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"
" Use Enter to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use Enter to confirm first option if no option is chosen
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nnoremap <Leader><Leader>hide :set conceallevel=0<CR>

" S to split under cursor, remove trailing whitespace on first line, and auto indent second line
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

"************************************************************************************************
"**************END PLUGIN SETTINGS***************************************************************
"************************************************************************************************

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']
let g:NERDTreeIgnore = ['\~$', '\.swp$', '^\.git$', '^\.DS_Store$']

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

lua require('telescope').setup{ defaults = require('configs/telescope') }
" setting up this nvim-treesitter stuff messes up folding. The new colors it gives it not worth it.
" lua require('configs/nvim-treesitter')

set conceallevel=0
let g:vimwiki_conceallevel=0

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=800 }
augroup END
