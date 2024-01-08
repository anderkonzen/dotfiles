-- Relative line numbers with number of current line
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab behaviour
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Smart autoindenting when starting a new line
vim.opt.smartindent = true

-- Swap files, backup, undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search setup
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Enable true colors support
vim.opt.termguicolors = true

-- Scroll, lines and columns behaviour
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true

-- More space for displaying messages
vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience. THE PRIMEAGEN
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Allow the cursor to go into invalid places
vim.opt.virtualedit = "block"

-- Normal OS clipboard interaction
vim.opt.clipboard:append({ "unnamedplus" })

vim.opt.listchars = { tab = '▸\\', space = '∙', trail = '∙', extends = '#', eol = '↩', nbsp = '_' }

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
