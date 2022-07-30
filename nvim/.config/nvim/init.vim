" SETS BLOCK {{{
" =============================================================================

" Tab behaviour
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Smart autoindenting when starting a new line
set smartindent

" Relative line numbers with number of current line
set relativenumber
set number

" Hide buffers instead of closing them
set hidden

" Do not ring any bells
set noerrorbells

" Swap files, backup, undo
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set autoread

" Enable true colors support
set termguicolors

" Scroll, lines and columns behaviour
set scrolloff=8
set cursorline
set nowrap
set signcolumn=yes
set colorcolumn=80
set showmatch
set nostartofline

" Insert mode completion
set completeopt=menuone,noselect

" Allow the cursor to go into invalid places
set virtualedit=block

" Normal OS clipboard interaction
set clipboard+=unnamedplus

" More space for displaying messages
set cmdheight=2

" Do not need to show mode with statusline plugin
set noshowmode

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience. THE PRIMEAGEN
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Show a list when pressing tab and complete first full match
set wildmode=list:full

set listchars=tab:▸\
set listchars+=space:∙
set listchars+=trail:∙
set listchars+=extends:#
set listchars+=eol:¬
set listchars+=nbsp:_

" }}}



" VIM-PLUG BLOCK {{{
" =============================================================================

call plug#begin('~/.config/nvim/plugged')

" Colors
Plug 'chriskempson/base16-vim'

" Statusline
Plug 'itchyny/lightline.vim'

" Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Using vim-elixir since treesitter is slow for Elixir
Plug 'elixir-editors/vim-elixir'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Comment stuff out (use gcc to comment and to uncomment)
Plug 'tpope/vim-commentary'

" To change ( with {: cs({; wrapp word with ': ysiw'
Plug 'tpope/vim-surround'

" Improves vim repeat feature '.'
Plug 'tpope/vim-repeat'

" ga shows better information on current character
Plug 'tpope/vim-characterize'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" Smart relative number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Displays thin vertical lines at each indentation level
Plug 'yggdroot/indentline'

" Show white space in red
Plug 'ntpeters/vim-better-whitespace'

" Improves tab completion in insert mode
" Plug 'ervandew/supertab'

" Plug 'mbbill/undotree'

" Be better at vim
Plug 'theprimeagen/vim-be-good'

" Code formatter
Plug 'sbdchd/neoformat'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Collection of configurations for built-in LSP client
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For luasnip users
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Icons for completion menu
Plug 'onsails/lspkind-nvim'

call plug#end()

" }}}



" COLORSCHEME {{{
" =============================================================================

colorscheme base16-tomorrow-night

" }}}



" MAPS BLOCK {{{
" =============================================================================

let mapleader      = " "
let maplocalleader = " "

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Save shortcuts
inoremap <C-s>     <C-O>:update<CR>
nnoremap <C-s>     :update<CR>
" Remap :W to :w
command! W w

" Quit
inoremap <C-Q>     <Esc>:q<CR>
nnoremap <C-Q>     :q<CR>
vnoremap <C-Q>     <Esc>:q<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

" Toggle show tabs and trailing spaces
nnoremap <silent> <Leader>tt :set nolist!<CR>

" Clear last search
nnoremap <silent> <Esc> <Esc>:noh<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Search and replace word under cursor
nnoremap <Leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <Leader>* "hy:%s/\V<C-r>h//<left>

" Enforce purity
nnoremap <Left>   <Nop>
nnoremap <Right>  <Nop>
nnoremap <Up>     <Nop>
nnoremap <Down>   <Nop>

" Kill the opened buffer
nnoremap <silent> <Leader>d :bp\|:bd #<CR>

" <Tab> / <s-Tab> | Circular windows navigation
nnoremap <Tab>   <c-w>w
nnoremap <S-Tab> <c-w>W

" Quickly move between current and last files
nnoremap <Leader><Leader> :e#<CR>

nnoremap <F5> :UndotreeToggle<CR>

nnoremap <F10> :NERDTreeToggle<CR>

" }}}



" PLUGINS BLOCK {{{
" =============================================================================

" -----------------------------------------------------------------------------
" indentline
" -----------------------------------------------------------------------------
let g:indentLine_char = '┊'
let g:indentLine_concealcursor = 'c'

" Toggles indent lines
nnoremap <Leader>ig :IndentLinesToggle<CR>

" -----------------------------------------------------------------------------
" vim-better-whitespace
" -----------------------------------------------------------------------------
" Strip trailing whitespace
nnoremap <Leader>ss :StripWhitespace<CR>

" -----------------------------------------------------------------------------
" lightline
" -----------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightLineGitBranch',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFilename',
      \   'lineinfo': 'LightLineLineinfo'
      \ },
      \ }

function! LightLineGitBranch()
  let branch = FugitiveHead()
  return branch !=# '' ? ' ' . branch : ''
endfunction

function! LightLineReadonly()
  return &readonly && &filetype !=# 'help' ? '' : ''
endfunction

function! LightLineFilename()
  if &buftype ==? 'quickfix'
    return "[Quickfix List]"
  endif

  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' : '' != fname ? fname : '[No Name]'
endfunction

function! LightLineLineinfo()
  let pos = line('.') . ':' . col('.')
  return ' ' . pos
endfunction

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=2

augroup nerd_loader
  autocmd!
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" }}}

