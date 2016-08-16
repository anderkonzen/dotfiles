" vim: set foldmethod=marker foldlevel=0:
"
" .vimrc, optimized for neovim & iTerm2
" by Anderson Konzen <anderson.konzen@gmail.com>
"
" Inspired by https://github.com/junegunn/dotfiles/blob/master/vimrc


" ============================================================================
" VIM-PLUG BLOCK {{{

silent! if plug#begin('~/.vim/plugged')

" Browsing
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'

" Edit
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Languages
Plug 'elixir-lang/vim-elixir'
" vim-ruby needs 'gem install neovim' if you want code completion (Omni Completion)
Plug 'vim-ruby/vim-ruby'
Plug 'elzr/vim-json', {'for' : 'json'}

" Lint
Plug 'scrooloose/syntastic'

" Add plugins to &runtimepath
call plug#end()
endif

" }}}


" ============================================================================
" BASIC SETTINGS {{{

let mapleader      = ' '
let maplocalleader = ' '

" Theme & Layout
colorscheme Tomorrow-Night-Eighties
set guifont=mononoki:h14

" Editor
set number                      " always show line numbers
set autoindent                  " always set autoindenting on
set smartindent                 " always set smartindenting on
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set shiftwidth=2                " number of spaces to use for autoindenting
set tabstop=2                   " a tab is two spaces
set expandtab                   " expand tabs by default (overloadable per file type)
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set scrolloff=5                 " keep 5 lines off the edges of the screen when scrolling
set autoread                    " automatically reload files changed outside of Vim
set clipboard=unnamed           " normal OS clipboard interaction
set showmatch                   " set show matching parenthesis
set autowrite                   " automatically save before :next, :make etc.
set nowrap                      " by default don't wrap line

" Searching
set hlsearch                    " highlight search terms
set ignorecase                  " ignore case when searching
set incsearch                   " show search matches as you type
" clears the search register
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Editor layout
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell Vim to always put a status line in, even if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high
set showcmd                     " show (partial) command in the last line of the screen
set visualbell                  " don't beep
set noerrorbells                " don't beep
set shortmess=aIT               " avoid a series of prompts caused by file messages
set list                        " show unprintable characters by default
set listchars=tab:▸\ ,space:·,trail:·,extends:#,nbsp:·
set virtualedit=block           " allow the cursor to go in to invalid places
set cursorline                  " underline the current line, for quick orientation
set title                       " change the terminal's title<Paste>
set completeopt=menuone,preview
set splitbelow                  " open new split panes to right...
set splitright                  " ... and bottom, which feels more natural

" Performance
set hidden                      " hide buffers instead of closing them
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete first full match
set switchbuf=useopen           " reveal already opened files from the quickfix window instead of opening new buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files
set shada='20,\"80              " read/write a .viminfo file, don't store more than 80 lines of registers

" }}}
"

" ============================================================================
" MAPPINGS {{{

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" <F10> | NERD Tree
nnoremap <F10> :NERDTreeToggle<cr>

" <F3> |  Toggle list (display unprintable characters)
inoremap <F3> :set list!<CR>
nnoremap <F3> :set list!<CR>

" Terminal
tnoremap <Esc><Esc> <C-\><C-n>

" Get off my lawn
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

nnoremap <Leader><Leader> :e#<CR>                   " quickly move between current and last files
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>    " strip all trailing whitespace from a file
nnoremap Y y$                                       " quick yanking to the end of the line
nnoremap <leader>s :source $MYVIMRC<CR>             " reload vimrc

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" }}}


" ============================================================================
" PLUGINS {{{

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" Use a single click to fold/unfold directories and a double click to open files
let NERDTreeMouseMode=2

" ----------------------------------------------------------------------------
" syntastic
" ----------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----------------------------------------------------------------------------
" lightline
" ----------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error'
      \ },
      \ }

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineBufferNumber()
  let nr = bufnr(bufname('%'))
  return '[' . nr . ']'
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' :
        \ LightLineBufferNumber() . ' ' . ('' != fname ? fname : '[No Name]')
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" ----------------------------------------------------------------------------
" vim-json
" ----------------------------------------------------------------------------
let g:vim_json_syntax_conceal = 0


