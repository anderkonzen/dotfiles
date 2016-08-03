" vim: set foldmethod=marker foldlevel=0:
"
" .vimrc, optimized for neovim  iTerm2
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
Plug 'vim-ruby/vim-ruby'
Plug 'elzr/vim-json', {'for' : 'json'}

" Lint
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }

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

" }}}
"

" ==================== vim-json ====================
let g:vim_json_syntax_conceal = 0

