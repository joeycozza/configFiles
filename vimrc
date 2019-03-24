call plug#begin('~/.vim/plugged')

"visual plugins
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'myusuf3/numbers.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-searchindex'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" javascript/node plugins
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'styled-components/vim-styled-components', {'branch': 'main'}

"React/html plugins
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'

" extend functionality plugins
Plug 'w0rp/ale'
Plug 'vimwiki/vimwiki'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'kshenoy/vim-signature'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'yuttie/comfortable-motion.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'wellle/targets.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sjl/gundo.vim'

call plug#end()

if has('nvim') && executable('nvr')
  let $VISUAL="nvm -cc split --remote-wait +'set bufhidden=wipe'"
endif

let g:mapleader=' '

"///////////////////Defaulting Registers////////////////////////////////////
let @f = 'diwdf(f)xa=> jk' " @f macro for converting function to arrow and deletes the parens
let @g = 'diwxf)a =>jk'    " @g macro for converting function to arrow and keeps the parens
let @c = '0ciwconstjkj'    " @c macro for changing a variable definition to const
"///////////////////////End Defaulting Registers/////////////////////////////

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

" pangloss/javascript sometimes sets conceal level. hidden reveal shorten This will turn it off
set conceallevel=0

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

" move whole line up or down
nnoremap <c-k> dd<Up><Up>p
nnoremap <c-j> ddp

nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader><Leader>d :bdelete!<CR>

inoremap jk <Esc>:w<CR>

"leader tab and leader \ for moving between buffers (nice for my ergodox keyboard)
noremap <Leader><Tab>  :bprevious<CR>
noremap <Leader>\      :bnext<CR>

" repeat last replacement of a word
nnoremap <leader>. :let @/=@"<CR>/<CR>cgn<c-r>.<esc>

nnoremap <Leader>r :TernRename<CR>

"Clear search highlighting and redraw the screen
nnoremap <silent> <c-l> :<c-u>nohlsearch<CR><c-l>

"Fugitive remappings for ease of use
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>

" move to next or previous gittable chunk change in file
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

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
nnoremap <Leader><Leader>json :enew<CR>:file scratchTrash.json<CR>p:set filetype=json<CR>:ALEFix<CR>

" Goto definition using tag data
nnoremap <Leader>gd <C-]>

nnoremap <silent> <Leader>f :execute 'Files ' . <SID>fzf_root()<CR>
nmap <Leader>nt :NERDTreeFind<CR>
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>p :silent %!prettier --stdin --stdin-filepath % --trailing-comma es5 --no-semi --single-quote --print-width 100<CR>

" use tab/shift-tab to forward/backward cycle deoplete completion list
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"

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

let g:fzf_action = {'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '0b$3$$3d'

let g:tern#is_show_argument_hints_enabled=1

let g:used_javascript_libs = 'underscore,chai,react'
let g:deoplete#enable_at_startup = 1

let g:UltiSnipsExpandTrigger = ';;'
let g:UltiSnipsJumpForwardTrigger = ';;'
let g:UltiSnipsJumpBackwardTrigger = '::'
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']

let g:vim_markdown_preview_github = 1
let g:vim_markdown_preview_browser = 'Google Chrome'

let g:ale_fixers = {
      \ 'css' : ['prettier'],
      \ 'javascript': ['eslint'],
      \ 'json': ['prettier'],
      \ 'html': ['prettier'],
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

let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'


let g:jsx_ext_required = 0

let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx'

"************************************************************************************************
"**************END PLUGIN SETTINGS***************************************************************
"************************************************************************************************
" augroup FiletypeGroup
"   autocmd!
"   au BufNewFile,BufRead *.html set filetype=javascript.html
" augroup END


" Help with terminal mode. Esc will now go back to normal mode
" if you NEED Esc to go to the terminal, do Ctrl-v and Esc, Verbatim Escape
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

augroup leavingVimStuff
  autocmd!
  autocmd VimLeave * set guicursor=a:ver10-blinkon0
augroup END

" Used in Normal mode completion
function! s:fzf_root()
  let l:path = finddir('.git', expand('%:p:h').';')
  return fnamemodify(substitute(l:path, '.git', '', ''), ':p:h')
endfunction

command! -nargs=+ -complete=custom,s:LebabComplete Lebab call s:Lebab(<f-args>)
function! s:Lebab(...)
  let l:transforms = a:000
  let l:filename = expand('%:p')

  let l:command_line = 'lebab '.shellescape(l:filename).' --transform '.join(l:transforms, ',')

  let l:new_lines = systemlist(l:command_line)
  if v:shell_error
    echoerr 'There was an error running lebab: '.join(l:new_lines, "\n")
    return
  endif

  %delete _
  call setline(1, l:new_lines)
endfunction
function! s:LebabComplete(argument_lead, command_line, cursor_position)
  let l:lebab_transforms = ['arg-rest', 'arg-spread', 'arrow', 'class:unsafe', 'commonjs:unsafe', 'default-param:unsafe', 'destruct-param:unsafe', 'exponent', 'for-each', 'for-of', 'includes:unsafe', 'let:unsafe', 'multi-var', 'no-strict', 'obj-method', 'obj-shorthand', 'template:unsafe']
  return join(l:lebab_transforms, "\n")
endfunction

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
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
