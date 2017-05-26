" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

silent! if plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-unimpaired'               " [b, ]b, ]t, etc...
Plug 'tpope/vim-commentary'               " comment stuff out (use gcc to comment and gcgc to uncomment)
Plug 'tpope/vim-eunuch'                   " :Rename, :Move...
Plug 'tpope/vim-endwise'                  " plugin that helps to end certain structures automatically
Plug 'tpope/vim-surround'                 " to change ( with {: cs({; wrapp word with ': ysiw'
Plug 'tpope/vim-repeat'                   " improve vim repeat feature '.'
Plug 'tpope/vim-characterize'             " ga shows better information on current character
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " <C-n> to toggle between number and relativenumber
Plug 'yggdroot/indentline'                " <leader>ig to toggle on/off
Plug 'ntpeters/vim-better-whitespace'     " show white space in red and :StripWhitespace
Plug 'ervandew/supertab'                  " improve <Tab> completion in insert mode

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'                    " :Ack [pattern] to search for pattern (grep)

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Colors
Plug 'chriskempson/base16-vim'

" Statusline
Plug 'itchyny/lightline.vim'

" Syntax and Lint
Plug 'ekalinin/Dockerfile.vim'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby'                  " vim-ruby needs 'gem install neovim' if you want code completion
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tmux-plugins/vim-tmux'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'

" Omnicomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
endif

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

let mapleader      = ' '
let maplocalleader = ' '

augroup vimrc
  autocmd!
augroup END

set termguicolors               " enable true colors support
set guifont=Hack:h14
colorscheme base16-tomorrow-night

set number                      " always show line numbers
set cmdheight=2                 " use a status bar that is 2 rows high
set showtabline=2               " always show tab bar
set title                       " change the terminal's title
set scrolloff=5                 " keep 5 lines off the edges of the screen when scrolling
set sidescrolloff=5             " start scrolling five columns before vertical border of window
set colorcolumn=100             " highlight the 100th column
set cursorline                  " highlight the current line, for quick orientation
set shortmess=aIT               " avoid a series of prompts caused by file messages
set showcmd                     " show (partial) command in the last line of the screen
set splitbelow                  " open new split panes to right...
set splitright                  " ... and bottom, which feels more natural
set virtualedit=block           " allow the cursor to go in to invalid places
set visualbell                  " don't beep
set autoread                    " automatically reload files changed outside of Vim
set autowrite                   " automatically save before :next, :make etc.
set clipboard=unnamed           " normal OS clipboard interaction
set expandtab                   " expand tabs to spaces (overloadable per file type)
set nostartofline               " don't reset cursor to start of line when moving around
set nowrap                      " by default don't wrap line
set shiftwidth=2                " number of spaces to use for autoindenting
set showmatch                   " set show matching parenthesis
set smartindent                 " always set smartindenting on
set tabstop=2                   " a tab is two spaces
set hidden                      " hide buffers instead of closing them
set lazyredraw                  " don't update the display while executing macros
set nobackup                    " do not keep backup files
set noshowmode                  " do not put mode message in last line
set noswapfile                  " do not write annoying intermediate swap files
set shada='20,\"80              " read/write a .viminfo file, don't store more than 80 lines of registers
set switchbuf=useopen           " reveal already opened files from the quickfix window instead of opening new buffers
set undofile                    " maintain undo history between sessions
set undolevels=1000             " use this many levels of undo
set wildmode=list:full          " show a list when pressing tab and complete first full match

set listchars=tab:▸\
set listchars+=space:∙
set listchars+=trail:∙
set listchars+=extends:#
set listchars+=eol:¬
set listchars+=nbsp:_

" Auto formatting
set formatoptions=
set formatoptions+=n            " recognize numbered lists
set formatoptions+=2            " use indent from 2nd line of a paragraph
set formatoptions+=l            " don't break lines that are already long
set formatoptions+=1            " break before 1-letter words

" Searching
set ignorecase                  " ignore case when searching
set magic                       " enable extended regexes
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set wrapscan                    " searches wrap around end of file

" Folding
set foldlevelstart=99           " default to all folds open when opening a buffer
set foldnestmax=4               " don't be absurd about how deeply to nest syntax folding
set foldopen-=block             " drives me nuts that moving with ] opens folds

" diff-mode (nvim -d file1 file2)
set diffopt=filler              " add vertical spaces to keep right and left aligned
set diffopt+=iwhite             " ignore whitespace changes (focus on code changes)

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" In and out of command mode quickly, less pain
noremap <CR> :

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Save
inoremap <C-s>     <C-O>:update<CR>
nnoremap <C-s>     :update<CR>
nnoremap <leader>s :update<CR>
nnoremap <leader>w :update<CR>
" Remap :W to :w
command! W w

" Quit
inoremap <C-Q>     <Esc>:q<CR>
nnoremap <C-Q>     :q<CR>
vnoremap <C-Q>     <Esc>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

" Toggle show tabs and trailing spaces
nnoremap <silent> <leader>tt :set nolist!<CR>

" Clear last search
nnoremap <silent> <Esc> <Esc>:noh<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Insert newline
map <leader><Enter> o<Esc>

" Search and replace word under cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>

" Enforce purity
nnoremap <Left>   <Nop>
nnoremap <Right>  <Nop>
nnoremap <Up>     <Nop>
nnoremap <Down>   <Nop>

" qq to record, Q to replay
nnoremap Q @q

" Kill the opened buffer
nnoremap <C-k> :bd<CR>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
" Quickly move between current and last files
nnoremap <Leader><Leader> :e#<CR>

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<CR>
nnoremap <silent> <C-j> :move+<CR>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<CR>gv
xnoremap <silent> <C-j> :move'>+<CR>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" <leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <leader>c :cclose<bar>lclose<CR>


" <F10> | NERD Tree
nnoremap <F10> :NERDTreeToggle<CR>

" Clever tpope
nnoremap <silent> <F9> :if &previewwindow<Bar>pclose<Bar>elseif exists(':Gstatus')<Bar>exe 'Gstatus'<Bar>else<Bar>ls<Bar>endif<CR>

" }}}
" ============================================================================
" PLUGINS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" deoplete
" ----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" ----------------------------------------------------------------------------
" indentline
" ----------------------------------------------------------------------------
let g:indentLine_char = '┊'
let g:indentLine_concealcursor = 'c'

" <leader>ig Toggles indent lines
nnoremap <Leader>ig :IndentLinesToggle<CR>

" ----------------------------------------------------------------------------
" vim-better-whitespace
" ----------------------------------------------------------------------------

" <leader>ss Strip trailing whitespace
nnoremap <leader>ss :StripWhitespace<CR>

" ----------------------------------------------------------------------------
" lightline
" ----------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFilename',
      \   'lineinfo': 'LightLineLineinfo'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error'
      \ },
      \ }

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightLineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' ' . branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? '' : '' != fname ? fname : '[No Name]'
endfunction

function! LightLineLineinfo()
  let pos = line('.') . ':' . col('.')
  return ' ' . pos
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" ----------------------------------------------------------------------------
" lightline
" ----------------------------------------------------------------------------
let g:elm_setup_keybindings = 0
let g:elm_jump_to_error = 0
let g:elm_make_show_warnings = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_browser_command = "open"
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 1

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=2
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" ----------------------------------------------------------------------------
" syntastic
" ----------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
let g:elm_syntastic_show_warnings = 1

" ----------------------------------------------------------------------------
" syntastic
" ----------------------------------------------------------------------------
" Do not jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Enhance :grep
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

" }}}
" ============================================================================
" AUTOCMD {{{
" ============================================================================
augroup vimrc
  au BufWritePost vimrc,.vimrc,init.vim nested if expand('%') !~ 'fugitive' | source % | endif

  " Almost never want to remain in paste mode after insert
  autocmd InsertLeave * if &paste | set nopaste paste? | endif

  " Automatic rename of tmux window
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup END

" Fun with some goodies hidden in vim-git ftplugins. {{{
augroup GitTricks
  autocmd!
  autocmd FileType gitrebase
        \ nnoremap <buffer> P :Pick<CR>   |
        \ nnoremap <buffer> S :Squash<CR> |
        \ nnoremap <buffer> E :Edit<CR>   |
        \ nnoremap <buffer> R :Reword<CR> |
        \ nnoremap <buffer> F :Fixup<CR>  |
        \ nnoremap <buffer> C :Cycle<CR>
augroup END " }}}

" }}}
" ============================================================================

" vim:foldmethod=marker foldlevel=0 foldclose=all commentstring="%s
