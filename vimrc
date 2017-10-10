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
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'airblade/vim-gitgutter'
Plug 'dbakker/vim-projectroot' " Gives you the ProjectRootExe function
Plug 'rking/ag.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'google/vim-searchindex'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vimwiki/vimwiki'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'

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

filetype plugin on

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

set suffixesadd+=.js
set path+=$PWD/node_modules
set inccommand=nosplit

set undofile                 "Save undo's after file closes
set undodir=$HOME/.vim/undo  " where to save undo histories
set undolevels=1000          "How many undos
set undoreload=10000         "number of lines to save for undo
" -----------------------------------------------------
" Displaying text
" -----------------------------------------------------
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number				                  "putting line numbers on in insert mode"

set scrolljump=1                " Lines to scroll when cursor leaves screen
set scrolloff=7                 " Minimum lines to keep above and below cursor
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

" this will replace the current word with the last thing yanked. Can be
" repeated without fear of overriding the last yanked thing
nnoremap <Leader>v diw"0P

"convenience for editing and sourcing .vimrc file
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" helpers for adding semicolon or comma and removing always at end of the current line
nnoremap ;; A;<Esc>
nnoremap ,, A,<Esc>
nnoremap :: $x<Esc>

" move whole line up or down
nnoremap <c-k> dd<Up><Up>p
nnoremap <c-j> ddp

" delete current working buffer.
nnoremap <Leader>d :bd<Enter>
" for delete if you dont care about saving
nnoremap <Leader><Leader>d :bd!<Enter>

inoremap jk <Esc>:w<Enter>
inoremap <c-h> <Left>
inoremap <c-l> <Right>
inoremap <c-j> <Down>
inoremap <c-k> <Up>

"leader tab and leader \ for moving between buffers
noremap <Leader><Tab>  :bp<CR>
noremap <Leader>\      :bn<CR>

"leader i and leader o for traversing the jump list
noremap <Leader>o <c-o>
noremap <Leader>i <c-i>

" repeat last replacement of a word
nnoremap <leader>. :let @/=@"<cr>/<cr>cgn<c-r>.<esc>


nnoremap <Leader>r :TernRename<cr>

"Clear search highlighting and redraw the screen
nnoremap <silent> <c-l> :<C-u>nohlsearch<cr><c-l> 

" Begin easyAlign 
xmap <Enter> <Plug>(EasyAlign)
" leader= will easy align the current paragraph on the = sign (requires   xmap <Enter> <Plug>(EasyAlign)   to be mapped as well)
nmap <Leader>a vip<Enter>=


"Fugitive remappings for ease of use
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gc :Gcommit<Enter>
nnoremap <Leader>gd :Gdiff<Enter>
nnoremap <Leader>gb :Gblame<Enter>
nnoremap <Leader>gl :Glog<Enter>
nnoremap <Leader>gp :Gpush<Enter>
" move to next or previous gittable chunk change in file
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

" Find project wide
nnoremap <Leader>sp :ProjectRootExe Ag<space><C-r><C-w><space>-Q<space>-w
vnoremap <Leader>sp "hy:ProjectRootExe Ag<space><C-r>h<space>
let g:ag_highlight=1

" Quick fix file navigation
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>

" Format json
nnoremap <Leader><Leader>j :%!python -m json.tool<CR>
vnoremap <Leader><Leader>j :'<,'>!python -m json.tool<CR><Paste>
nmap <Leader><Leader>json :enew<CR>:file scratchJSON<CR>p<Leader><Leader>j

nnoremap <silent> <Leader>f :exe 'Files ' . <SID>fzf_root()<CR>

" NERDTree customizations
map <C-n> :exe 'NERDTreeToggle ' . <SID>fzf_root()<CR>
nmap <Leader>nt :NERDTreeFind<CR>

nnoremap <Leader>p :ALEFix<CR>

" -----------------------------------------------------
" Plugin settings
" -----------------------------------------------------

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '\.swp$', '^\.git$', '^\.DS_Store$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" FZF customizations" 
" This is the default extra key bindings
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
let g:fzf_action = {'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }

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

let g:airline#extensions#tabline#enabled=1

let g:tern#is_show_argument_hints_enabled=1

let g:used_javascript_libs = 'underscore,react,chai'
let g:deoplete#enable_at_startup = 1

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']

let g:airline_theme='simple'

" Don't indent promise chains (https://github.com/pangloss/vim-javascript/issues/467#issuecomment-247851078)
let g:javascript_opfirst = 1

let vim_markdown_preview_github = 1

let g:ale_fixers = {'javascript': ['eslint', 'prettier']}
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enables = 1
let g:ale_javascript_prettier_options = '--single-quote --print-width=120'

"************************************************************************************************
"**************END PLUGIN SETTINGS***************************************************************
"************************************************************************************************

function! EslintFix()
   let l:winview = winsaveview()
   silent !eslint --fix %
   call winrestview(l:winview)
endfunction
command! EslintFix :call EslintFix()


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" Normal mode completion
function! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfunction
