local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

-- visual
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

-- javascript/node
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug('ternjs/tern_for_vim', { ['do'] = 'npm install' })
Plug('styled-components/vim-styled-components', {branch = 'main'})
Plug 'leafgarland/typescript-vim'

-- React/html
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'jxnblk/vim-mdx-js'

-- Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

-- extend functionality
Plug('neoclide/coc.nvim', {branch = 'release'})

Plug('scrooloose/nerdtree', { on = 'NERDTreeFind' })

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

Plug('JamshedVesuna/vim-markdown-preview', { ['for'] = 'markdown' })

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'pedrohdz/vim-yaml-folds'
Plug 'dstein64/vim-startuptime'

vim.call('plug#end')
