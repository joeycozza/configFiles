lua require('plugins')
lua require('impatient')
lua require('globals')
lua require('autocommands')
lua require('options')
lua require('keymaps')

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

"-----------------------------------------------
" --------------Remapping Keys------------------
"  ---------------------------------------------

" Format json
vnoremap <Leader><Leader>j :'<,'>!python $CONFIG_FILES_PATH/jsonTool.py<CR><Paste>:set nopaste<CR>

nnoremap <Leader><Leader>hide :set conceallevel=0<CR>

"************************************************************************************************
"**************END PLUGIN SETTINGS***************************************************************
"************************************************************************************************

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips']

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

lua require('user/onedark')
lua require('user/nrpattern')
lua require('user/mind')
lua require('user/jester')
lua require('user/lsp')
lua require('user/cmp')
lua require('user/treesitter')
lua require('user/telescope')
lua require('user/null-ls')
lua require('user/neo-tree')
lua require('user/leap')
lua require('user/mini')
lua require('user/trouble')
lua require('inc_rename').setup()
