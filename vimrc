call plug#begin('~/.vim/plugged')

"visual

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" javascript/node
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'leafgarland/typescript-vim'

"React/html
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'jxnblk/vim-mdx-js'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" extend functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }

Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

Plug 'joeycozza/vim-obsession'

Plug 'wellle/targets.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'

Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'pedrohdz/vim-yaml-folds'
Plug 'dstein64/vim-startuptime'

call plug#end()

if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

let g:mapleader=' '


" speed up python executable finding, and fix issue with not finding python3 correctly
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

"///////////////////Defaulting Registers////////////////////////////////////
let @c = '0ciwconstjkj'    " @c macro for changing a variable definition to const
"///////////////////////End Defaulting Registers/////////////////////////////

" https://github.com/neoclide/coc.nvim#example-vim-configuration
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set cmdheight=2

"Normally Vim rerenders the screen after every step of the macro, which looks weird and slows the execution down.
"With this change it only rerenders at the end of the macro.
set lazyredraw

set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

filetype plugin on

set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator
set iskeyword-=-                " '-' is an end of word designator

set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

set foldmethod=syntax  " vim-javascript can take advantage of syntax to fold smarter
set nofoldenable       " when opening a file, dont start with any folding
set foldnestmax=10
set foldlevel=10
set foldtext=FoldText()

set updatetime=250
set noswapfile
set hidden             "switch buffers without saving

set inccommand=nosplit

set undofile                 "Save undo's after file closes
set undodir=$HOME/.vim/undo  "Where to save undo histories
set undolevels=1000          "How many undos
set undoreload=1000          "number of lines to save for undo
" -----------------------------------------------------
" Displaying text
" -----------------------------------------------------
set number                      " putting line numbers on in insert mode"

set scrolloff=7                 " Minimum lines to keep above and below cursor
set nowrap                      " Don't wrap long lines Don't
set nocursorcolumn
set cursorline

set expandtab "hitting tab insert spaces instead of <Tab>
set tabstop=2
set shiftwidth=2
set softtabstop=2

syntax on
colorscheme gruvbox
set background=dark

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

" Find project wide
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --line-number --no-heading --fixed-strings --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ -H\ --no-heading\ --vimgrep

" pangloss/javascript sometimes sets conceal level. hidden reveal shorten This is supposed to turn it off...
set conceallevel=0
let g:vimwiki_conceallevel=0
nnoremap <leader>hide :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

"-----------------------------------------------
" --------------Remapping Keys------------------
"  ---------------------------------------------

" this will replace the current word with the last thing yanked. Can be
" repeated without fear of overriding the last yanked thing
" delete into blackhole register, then paste 0 register (last yanked item)
nnoremap <Leader>v "_diw"0P

"convenience for editing and sourcing .vimrc file
nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

"add comma to end of line and put cursor back where it was
nnoremap ,, m`A,<Esc>``m`
"remove last character from line and put cursor back where it was
nnoremap :: m`$x<Esc>``m`

" mode selection (or line) up or down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader><Leader>d :bdelete!<CR>
tnoremap <Leader><Leader>d <c-\><c-n>:bdelete!<CR>

inoremap jk <Esc>:w<CR>

"leader tab and leader \ for moving between buffers (nice for my ergodox keyboard)
noremap <Leader><Tab>  :bprevious<CR>
noremap <Leader>\      :bnext<CR>

" repeat last replacement of a word
nnoremap <leader>. :let @/=@"<CR>/<CR>cgn<c-r>.<esc>

"Clear search highlighting and redraw the screen
nnoremap <silent> <c-l> :<c-u>nohlsearch<CR><c-l>

"Fugitive remappings for ease of use
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>

" move to next or previous gittable chunk change in file
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hp <Plug>(GitGutterPrevHunk)

" who needs EX mode? last macro with Q
nnoremap Q @@

nnoremap <Leader>sp :Find <C-r><C-w>

" LocationList navigation
nnoremap <Up> :lopen<CR>
nnoremap <Down> :lclose<CR>
nnoremap <Left> :lprev<CR>
nnoremap <Right> :lnext<CR>

" Format json
vnoremap <Leader><Leader>j :'<,'>!python $CONFIG_FILES_PATH/jsonTool.py<CR><Paste>:set nopaste<CR>
nnoremap <Leader><Leader>json :enew<CR>:file scratchTrash.json<CR>p:set filetype=json<CR>:CocCommand prettier.formatFile<CR>

nnoremap <silent> <Leader>f :execute 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <Leader>jf :call Fzf_dev_previews()<CR>
nmap <Leader>nt :NERDTreeFind<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <Leader>r <Plug>(coc-rename)
nnoremap <Leader>p :CocCommand prettier.formatFile<CR>
nnoremap <Leader>af :CocCommand eslint.executeAutoFix<CR>
nnoremap <Leader><Leader>p :silent %!prettier --stdin --stdin-filepath % --trailing-comma es5 --no-semi --single-quote --print-width 120<CR>

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
" -----------------------------------------------------
" Plugin settings
" -----------------------------------------------------

let g:matchup_matchparen_deferred=1
let g:matchup_matchparen_hi_surround_always=1

let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\~$', '\.swp$', '^\.git$', '^\.DS_Store$']
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

let g:fzf_layout = { 'window': { 'width': 0.90, 'height': 0.8} }
let $FZF_DEFAULT_OPTS="--reverse " " top to bottom

" turn off the git branch info since it is in terminal status bar already
let g:airline_section_b = ''

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
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

autocmd FileType json syntax match Comment +\/\/.\+$+

" This fixes my cursor the way I like it in the terminal after quitting vim
augroup leavingVimStuff
  autocmd!
  autocmd VimLeave * set guicursor=a:ver10-blinkon0
augroup END

" Used in Normal mode completion
function! s:fzf_root()
  let l:path = finddir('.git', expand('%:p:h').';')
  return fnamemodify(substitute(l:path, '.git', '', ''), ':p:h')
endfunction

" Files + devicons + floating fzf
function! Fzf_dev_previews()
  let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m --reverse ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'window': { 'width': 1, 'height': 0.8, 'highlight': 'Question'}
        \  })

endfunction


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('mdx', 'lightblue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

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
