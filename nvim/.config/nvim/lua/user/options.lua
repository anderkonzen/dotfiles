-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Tab behaviour
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.breakindent = true

-- Disable text wrap
vim.opt.wrap = false

-- Swap files, backup, undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enable incremental searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable true colors support
vim.opt.termguicolors = true

-- Scroll, lines and columns behaviour
-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8
-- Enable cursor line highlight
vim.opt.cursorline = true
vim.opt.wrap = false
-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true

-- More space for displaying messages
vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience. THE PRIMEAGEN
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Allow the cursor to go into invalid places
vim.opt.virtualedit = "block"

-- Normal OS clipboard interaction
vim.opt.clipboard:append({ "unnamed",  "unnamedplus" })

vim.opt.listchars = { tab = '▸\\', space = '∙', trail = '∙', extends = '#', eol = '↩', nbsp = '_' }

