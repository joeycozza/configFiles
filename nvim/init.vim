let g:ale_disable_lsp = 1

lua require('plugins')
lua require('commands')
lua require('globals')
lua require('options')
lua require('keymaps')
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

let g:loaded_perl_provider = 0

let g:ale_fixers = {
      \ 'css' : ['prettier'],
      \ 'html': ['prettier'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'json': ['prettier'],
      \ 'lua': ['lua-format'],
      \ 'markdown': ['prettier'],
      \ 'vim' : ['trim_whitespace'],
      \ 'yaml': ['prettier']
      \ }

let g:ale_linters = {
      \ 'bash': ['shellcheck'],
      \ 'dockerfile': ['hadolint'],
      \ 'javascript': ['eslint'],
      \ 'vim': ['vint'],
      \ 'yaml': ['yamllint'],
      \ 'zsh': ['shellcheck']
      \ }

" Use just ESLint (not prettier) for fixing js or jsx files found in the /nunya/ directory
" \= is to match 0 or 1 of the preceeding character in vim. http://vimregex.com/
let g:ale_pattern_options = {
 \   '\/nunya\/.*\.jsx\=$': {
 \       'ale_fixers': ['eslint'],
 \   },
 \}

set completeopt=menu,menuone,noselect

"-----------------------------------------------
" --------------Remapping Keys------------------
"  ---------------------------------------------

" Format json
vnoremap <Leader><Leader>j :'<,'>!python $CONFIG_FILES_PATH/jsonTool.py<CR><Paste>:set nopaste<CR>

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
lua require('telescope').load_extension('fzf')
lua require('configs/nvim-treesitter')
lua require('configs/nrpattern')
lua require('mind').setup()
lua require('jester').setup(require('configs/jester'))
lua require('cmp').setup(require('configs/nvim-cmp'))
