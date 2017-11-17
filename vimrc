function! LoadAndDestroy(plugin, ...) abort
  call plug#load(a:plugin)
  execute 'autocmd! Defer_'.a:plugin
  if a:0
    execute a:1
  endif
endfunction

function! Defer(github_ref, ...) abort
  if !has('vim_starting')
    return
  endif
  let l:plug_args = a:0 ? a:1 : {}
  call extend(l:plug_args, { 'on': [] })
  call plug#(a:github_ref, l:plug_args)
  let plugin = a:github_ref[stridx(a:github_ref, '/') + 1:]
  let lad_args = '"'.plugin.'"'
  if a:0 > 1
    let lad_args .= ', "'.a:2.'"'
  endif
  let call_loadAndDestroy = 'call LoadAndDestroy('.lad_args.')'
  execute 'augroup Defer_'.plugin.' |'
        \ '  autocmd CursorHold,CursorHoldI * '.call_loadAndDestroy.' | '
        \ 'augroup end'
endfunction

command! -nargs=+ DeferPlug call Defer(<args>)

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'

DeferPlug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
DeferPlug 'junegunn/fzf.vim'
DeferPlug 'ternjs/tern_for_vim', { 'do': 'npm install' }
DeferPlug 'myusuf3/numbers.vim'
DeferPlug 'scrooloose/nerdtree'
DeferPlug 'moll/vim-node'
DeferPlug 'pangloss/vim-javascript'
DeferPlug 'Shougo/deoplete.nvim'
DeferPlug 'kshenoy/vim-signature'
DeferPlug 'SirVer/ultisnips'
DeferPlug 'tpope/vim-surround'
DeferPlug 'tpope/vim-fugitive'
DeferPlug 'tpope/vim-repeat'
DeferPlug 'tpope/vim-commentary'
DeferPlug 'airblade/vim-gitgutter'
DeferPlug 'yuttie/comfortable-motion.vim'
DeferPlug 'jiangmiao/auto-pairs'
DeferPlug 'google/vim-searchindex'
DeferPlug 'AndrewRadev/splitjoin.vim'
DeferPlug 'vimwiki/vimwiki'
DeferPlug 'easymotion/vim-easymotion'
DeferPlug 'w0rp/ale'
DeferPlug 'JamshedVesuna/vim-markdown-preview'
DeferPlug 'ludovicchabant/vim-gutentags'
DeferPlug 'machakann/vim-highlightedyank'

call plug#end()

if has('nvim') && executable('nvr')
  let $VISUAL="nvm -cc split --remote-wait +'set bufhidden=wipe'"
endif

let g:mapleader=' '

"///////////////////Defaulting Registers////////////////////////////////////
let @f = 'diwdf(f)xa=> jk' " @f macro for converting function to arrow and deletes the parens
let @g = 'diwxf)a =>jk'    " @g macro for converting function to arrow and keeps the parens
"///////////////////////End Defaulting Registers/////////////////////////////

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
set foldnestmax=1

set updatetime=250
set noswapfile
set hidden "switch buffers without saving
set showcmd "show as commands are being typed

set suffixesadd+=.js
set path+=$PWD/node_modules
set inccommand=nosplit

set undofile                 "Save undo's after file closes
set undodir=$HOME/.vim/undo  "Where to save undo histories
set undolevels=1000          "How many undos
set undoreload=10000         "number of lines to save for undo
" -----------------------------------------------------
" Displaying text
" -----------------------------------------------------
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " putting line numbers on in insert mode"

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

set diffopt=filler,vertical
"-----------------------------------------------
" --------------Remapping Keys------------------
"  ---------------------------------------------
nnoremap ; :

nnoremap <Leader>_ :terminal n_<CR>

" this will replace the current word with the last thing yanked. Can be
" repeated without fear of overriding the last yanked thing
" delete into blackhole register, then paste 0 register (last yanked item)
nnoremap <Leader>v "_diw"0P

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
nnoremap <Leader>d :bdelete<Enter>
" for delete buffer if you dont care about saving
nnoremap <Leader><Leader>d :bdelete!<Enter>

inoremap jk <Esc>:w<Enter>

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

"Fugitive remappings for ease of use
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gc :Gcommit<Enter>
nnoremap <Leader>gb :Gblame<Enter>
nnoremap <Leader>gm :Gdiff<Enter>
nnoremap <Leader>gp :Gpush<Enter>
nnoremap <Leader>gr :Gread<Enter>
nnoremap <Leader>gw :Gwrite<Enter>
nnoremap <Leader>gu :diffupdate<Enter>
nnoremap <Leader>g2 :diffget //2<Enter>:diffupdate<Enter>
nnoremap <Leader>g3 :diffget //3<Enter>:diffupdate<Enter>
nnoremap <Leader>gp [c
nnoremap <Leader>gn ]c

" move to next or previous gittable chunk change in file
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

" Find project wide
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ -H\ --no-heading\ --vimgrep

nnoremap <Leader>sp :Find <C-r><C-w>

" LocationList navigation
nnoremap <Up> :lopen<CR>
nnoremap <Down> :lclose<CR>
nnoremap <Left> :lprev<CR>
nnoremap <Right> :lnext<CR>
nnoremap <Leader><Left> :lfirst<CR>
nnoremap <Leader><Right> :llast<CR>

" Format json
nnoremap <Leader><Leader>j :%!python -m json.tool<CR>
vnoremap <Leader><Leader>j :'<,'>!python -m json.tool<CR><Paste>
nmap <Leader><Leader>json :enew<CR>:file scratchJSON<CR>p<Leader><Leader>j

nnoremap <Leader>gd <C-]>
nnoremap <silent> <Leader>f :exe 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <Leader>zm :Marks<CR>
nnoremap <silent> <Leader>zt :Tags<CR>
nnoremap <silent> <Leader>zl :Lines<CR>

" NERDTree customizations
map <C-n> :exe 'NERDTreeToggle ' . <SID>fzf_root()<CR>
nmap <Leader>nt :NERDTreeFind<CR>

nnoremap <Leader>p :ALEFix<CR>

" this is mainly for movement within the autocompletion lists
inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>
" -----------------------------------------------------
" Plugin settings
" -----------------------------------------------------

let g:NERDTreeShowBookmarks=1
let g:NERDTreeIgnore=['\~$', '\.swp$', '^\.git$', '^\.DS_Store$']
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeChDirMode=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeMouseMode=2
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" FZF customizations"
" This is the default extra key bindings
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

let g:used_javascript_libs = 'underscore,chai'
let g:deoplete#enable_at_startup = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']

let g:airline_theme='simple'

" Don't indent promise chains (https://github.com/pangloss/vim-javascript/issues/467#issuecomment-247851078)
let g:javascript_opfirst = 1

let g:vim_markdown_preview_github = 1
let g:vim_markdown_preview_browser = 'Google Chrome'

let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier']
      \ }

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'vim': ['vint']
      \ }

let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_prettier_options = '--single-quote --print-width=120 --no-bracket-spacing'

let g:highlightedyank_highlight_duration = 5000
"************************************************************************************************
"**************END PLUGIN SETTINGS***************************************************************
"************************************************************************************************

function! EslintFix()
   let l:winview = winsaveview()
   silent !eslint --fix %
   call winrestview(l:winview)
endfunction
command! EslintFix :call EslintFix()

" Normal mode completion
function! s:fzf_root()
  let l:path = finddir('.git', expand('%:p:h').';')
  return fnamemodify(substitute(l:path, '.git', '', ''), ':p:h')
endfunction
