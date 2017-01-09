call plug#begin('~/.vim/plugged')
  
Plug 'myusuf3/numbers.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'Shougo/deoplete.nvim'
Plug 'kshenoy/vim-signature' " Adds label in gutter for marks
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-easy-align'
Plug 'wikitopian/hardmode'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'airblade/vim-gitgutter'
Plug 'dbakker/vim-projectroot' " Gives you the ProjectRootExe function
Plug 'rking/ag.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'flowtype/vim-flow'

call plug#end()

let mapleader=' '
"///////////////////Defaulting Registers////////////////////////////////////
let @f = 'diwdf(f)xa=> jk' " @f macro for converting function to arrow and deletes the parens
let @g = 'diwxf)a =>jk'    " @g macro for converting function to arrow and keeps the parens
"///////////////////////End Defaulting Registers/////////////////////////////
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator
set iskeyword-=-                " '-' is an end of word designator
set laststatus=2                " Always show the status bar / Airline

set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

set foldmethod=syntax  " vim-javascript can take advantage of syntax to fold smarter
set nofoldenable " when opening a file, dont start with any folding
set foldnestmax=20

set updatetime=250
set noswapfile

set hidden "switch buffers without saving
set showcmd "show as commands are being typed

" -----------------------------------------------------
" Displaying text
" -----------------------------------------------------
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu				                  "putting line numbers on in insert mode"

set scrolljump=1                " Lines to scroll when cursor leaves screen
set scrolloff=10                 " Minimum lines to keep above and below cursor
set nowrap                      " Don't wrap long lines Don't
set nocursorcolumn
set cursorline

" indenting http://tedlogan.com/techblog3.html
set autoindent 
set expandtab "hitting tab insert spaces instead of <Tab>
set tabstop=2
set shiftwidth=2
set softtabstop=2

syntax on
colorscheme gruvbox
set background=dark

set clipboard=unnamed "copy to system clipboard

"-----------------------------------------------
" --------------Remapping Keys------------------
"  ---------------------------------------------
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

nnoremap <Leader>ev :e $MYVIMRC<cr> " vimrc edit
nnoremap <Leader>sv :source $MYVIMRC<cr> " vimrc source
nnoremap ;; A;<Esc>
nnoremap <c-k> dd<Up><Up>p
nnoremap <c-j> ddp
nnoremap <Leader>d :bd<Enter>

inoremap jk <Esc>:w<Enter>
inoremap <c-h> <Left>
inoremap <c-l> <Right>
inoremap <c-j> <Down>
inoremap <c-k> <Up>

nnoremap <Leader>= za
nnoremap <Leader>- zc


nnoremap <silent> <c-c> :<C-u>nohlsearch<cr><c-l>

" use tab to forward cycle
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"

vmap     <Enter> <Plug>(EasyAlign) " align when in visual mode

"Fugitive remappings for ease of use
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gc :Gcommit<Enter>
nnoremap <Leader>gd :Gdiff<Enter>
nnoremap <Leader>gb :Gblame<Enter>
nnoremap <Leader>gl :Glog<Enter>
nnoremap <Leader>gp :Gpush<Enter>

"tab and shift tab for moving between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

" Find project wide
nnoremap <Leader><Leader>/ :ProjectRootExe Ag<space><C-r><C-w><space>-Q<space>-w
vnoremap <Leader><Leader>/ "hy:ProjectRootExe Ag<space><C-r>h<space>

" Quick fix file navigation
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>

"Clear search highlighting and redraw the screen
nnoremap <silent> <c-l> :<C-u>nohlsearch<cr><c-l> 

"  ---------------------------------------------
"  -------------End Remapping Keys--------------
"  ---------------------------------------------



" -----------------------------------------------------
" PLugin settings
" -----------------------------------------------------
" NERFTree customizations
map <C-n> :exe 'NERDTreeToggle ' . <SID>fzf_root()<CR>
nmap <Leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '\.swp$', '^\.git$','^node_modules$', '^\.DS_Store$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" FZF customizations" 
" This is the default extra key bindings
let $FZF_DEFAULT_COMMAND='ag --hidden -g ""'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~20%' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Advanced customization using autoload functions
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Normal mode completion
fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

nnoremap <silent> <Leader>f :exe 'Files ' . <SID>fzf_root()<CR>

" Insert mode completion
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:airline#extensions#tabline#enabled=1


let g:used_javascript_libs = 'underscore,react,chai'
let g:deoplete#enable_at_startup = 1


let g:SuperTabDefaultCompletionType = '<C-j>'
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']

let g:go_fmt_command = "goimports"
nmap <Leader>b :GoBuild<cr>
nmap <Leader>r :GoRun<cr>

let g:airline_theme='simple'
"************************************************************************************************
"**************END PLUGIN SETTINGS***************************************************************
"************************************************************************************************

function! EslintFix()
   let l:winview = winsaveview()
   silent !eslint --fix %
   call winrestview(l:winview)
endfunction
command! EslintFix :call EslintFix()
