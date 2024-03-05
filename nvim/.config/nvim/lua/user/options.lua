-- [[ Setting options ]]
--  See `:help vim.opt`
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable auto indenting, break indent
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Tab behaviour
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Swap files, backup, undo
vim.opt.swapfile = false
vim.opt.backup = false
-- Save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scroll, lines and columns behaviour
-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 10
-- Enable cursor line highlight
vim.opt.cursorline = true
vim.opt.wrap = false
-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.listchars = { tab = "▸\\", space = "∙", trail = "∙", extends = "#", eol = "↩", nbsp = "_" }

-- Enable incremental searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Disable text wrap
vim.opt.wrap = false

-- Enable true colors support
vim.opt.termguicolors = true

-- For more space for displaying messages, uncomment this
-- vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience. THE PRIMEAGEN
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Allow the cursor to go into invalid places
vim.opt.virtualedit = "block"
