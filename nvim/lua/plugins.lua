local Plug = vim.fn['plug#']

vim.call('plug#begin', vim.fn.expand('~/.config/nvim/plugged'))

-- visual
Plug 'navarasu/onedark.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

-- javascript/node
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
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

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug('phaazon/mind.nvim', {branch = 'v2'})
Plug 'SirVer/ultisnips'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

Plug 'joeycozza/vim-obsession'

Plug 'wellle/targets.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ggandor/leap.nvim'
Plug 'ggandor/flit.nvim'
-- Plug 'easymotion/vim-easymotion'

Plug('JamshedVesuna/vim-markdown-preview', { ['for'] = 'markdown' })

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})

Plug 'numToStr/FTerm.nvim'

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'} )
Plug 'David-Kunz/treesitter-unit'

Plug 'pedrohdz/vim-yaml-folds'
Plug 'zegervdv/nrpattern.nvim'
Plug 'dstein64/vim-startuptime'

Plug 'David-Kunz/jester'

Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'smjonas/inc-rename.nvim'

Plug 'lewis6991/impatient.nvim'

Plug 'echasnovski/mini.nvim'

vim.call('plug#end')
