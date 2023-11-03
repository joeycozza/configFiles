local opt = vim.opt

opt.cmdheight = 2
opt.shortmess = "ITF"

opt.completeopt = { "menu", "menuone", "noselect" }

opt.undodir = vim.fn.expand("$HOME/.config/nvim/undo")

-- Normally Vim rerenders the screen after every step of the macro, which looks weird and slows the execution down.
-- With this change it only rerenders at the end of the macro.
opt.lazyredraw = true

opt.ignorecase = true
opt.smartcase = true

opt.whichwrap = "b,s,h,l,<,>,[,]" -- Backspace and cursor keys wrap too

opt.laststatus = 0

opt.sessionoptions:append({ "globals" })

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- when opening a file, dont start with any folding
opt.foldnestmax = 10
opt.foldlevel = 10

opt.timeoutlen = 500
opt.updatetime = 250
opt.swapfile = false

opt.undofile = true -- Save undo's after file closes
opt.undolevels = 1000 -- How many undos
opt.undoreload = 1000 -- number of lines to save for undo

opt.clipboard = "unnamed" -- copy to system clipboard

opt.fixendofline = false

-- Turn off all mouse functionality
opt.mouse = ""

-----------------------------------------------------
-- Displaying text
-----------------------------------------------------
opt.number = true -- putting line numbers on the left side

opt.scrolloff = 7 -- Minimum lines to keep above and below cursor
opt.wrap = false -- Don't wrap long lines
opt.cursorcolumn = false
opt.cursorline = true

opt.expandtab = true --hitting tab insert spaces instead of <Tab>
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
