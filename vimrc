"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle '907th/vim-auto-save'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'benmills/vimux'
NeoBundle 'bogado/file-line'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'elzr/vim-json'
NeoBundle 'gitignore.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'

" Themes
NeoBundle 'sjl/badwolf'
NeoBundle 'altercation/vim-colors-solarized'

" Ruby
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'jgdavey/vim-turbux'

" Clojure
NeoBundle 'amdt/vim-niji'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'vim-scripts/paredit.vim'

" Erlang
NeoBundle 'edkolev/erlang-motions.vim'
NeoBundle 'jimenezrick/vimerl'

" Haskell
"NeoBundle 'yogsototh/haskell-vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'eagletmt/ghcmod-vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let mapleader="\<Space>"              " Remap the leader from \ to <Space>

syntax enable
set background=light
colorscheme solarized

set shell=/bin/bash                   " required for Vim to work inside Fish shell
set cursorline                        " Highlight current line
set expandtab                         " Insert spaces instead of actually tabs
set tabstop=2                         " Number of spaces each tab counts for
set softtabstop=2                     " Number of spaces for some tab operations
set shiftwidth=2                      " The space << and >> moves the lines
set smartindent                       " Smart auto-indent when creating a new line
set colorcolumn=85
set synmaxcol=300                     " The max number of columns to try and highlight
set ttyfast                           " Optimize for fast terminal connections
set lazyredraw                        " Don't redraw vim in all situations
set encoding=utf-8                    " Set the default encodings just in case $LANG isn't set
set nowrap                            " Don't wrap lines
set number                            " Enable line numbers
set relativenumber
set nowritebackup                     " Don't create a backup when overwriting a file
set noswapfile                        " Don't write swap files
set nobackup                          " Don't keep backup files
set hidden
set scrolloff=5                       " Lines the cursor is to the edge before scrolling
set complete=.,w,b,u,t
set completeopt=menu,preview
set wildmode=list:longest,list:full
set wildignore+=.hg,.git,.svn                           " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg          " Binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc  " Compiled object files
set wildignore+=tags,gems.tags
set tags+=gems.tags
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_  " Show “invisible” characters
set nojoinspaces                      " Don't add 2 spaces when using J
set title                             " Change the terminal's title

if has("clipboard")                   " If the feature is available
  set clipboard=unnamed               " copy to the system clipboard

  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif

" Custom Mappings ------ {{{
" Quick ESC
inoremap jk <ESC>

" Select entire file
nnoremap <leader>v ggV`]

" Format entire file
nmap <leader>fef ggVG=

" Jump to the next row on long lines
nnoremap j gj
nnoremap k gk

nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" http://felixge.de/2013/08/08/vim-trick-open-current-line-on-github.html
nnoremap <leader>ou :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs chromium-browser<CR><CR>

augroup vimrc
  autocmd!
augroup END

" Better commit message
au vimrc Filetype gitcommit setlocal spell textwidth=72

" Spelling
source ~/.vim-addons/spelling.vim

au vimrc BufNewFile * set noeol

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Resize splits when the window is resized
au vimrc VimResized * :wincmd =

" Automatically removing all trailing whitespace
au vimrc BufWritePre * :%s/\s\+$//e

au vimrc BufRead,BufNewFile *.md setlocal textwidth=80

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" }}}

" Windows And Splits ------ {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
" }}}

" Search ------ {{{
nnoremap / /\v
vnoremap / /\v
set gdefault                          " Adds g at the end of substitutions by default
set hlsearch                          " Highlight searches
set ignorecase                        " Ignore case of searches
set smartcase
" }}}

" Plugins ------ {{{

" NeoBundle
let g:neobundle#install_process_timeout = 1500

" Ag
let g:agprg = 'ag --nogroup --nocolor --column --smart-case'
cabbrev Agfs AgFromSearch

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" AutoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" Vim-Json
let g:vim_json_syntax_conceal = 0

" EasyMotion
let g:EasyMotion_leader_key = ';'

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" lightline
let g:lightline = {
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ }
    \ }

" Syntastic
let g:syntastic_javascript_checkers = ['eslint', 'jsxhint']
let g:syntastic_erlang_checkers = ['syntaxerl']

" }}}

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
