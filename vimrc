set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" My Bundles
Plugin '907th/vim-auto-save'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'elzr/vim-json'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

" Ruby
Plugin 'nelstrom/vim-textobj-rubyblock'

" Clojure
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'

call vundle#end()
filetype plugin indent on

let mapleader=","

color seoul256

set autoread
set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set colorcolumn=85
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set autoindent
set wildmode=list:longest,full
set wildmenu
set wildignore+=tags,gems.tags
set tags+=gems.tags
set clipboard=unnamedplus

" ================== Custom Mappings ==================
" Quick ESC
inoremap jk <ESC>

" Select entire file
nnoremap <leader>v ggV`]

" Format entire file
nmap <leader>fef ggVG=

" Jump to the next row on long lines
nnoremap j gj
nnoremap k gk

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" http://felixge.de/2013/08/08/vim-trick-open-current-line-on-github.html
nnoremap <leader>ou :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs chromium-browser<CR><CR>

" Better commit message
au Filetype gitcommit setlocal spell textwidth=72

" Spelling
source ~/.vim-addons/spelling.vim

au BufNewFile * set noeol

" No show command
autocmd VimEnter * set nosc

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Allows you to enter sudo pass and save the file
" when you forgot to open your file with sudo
cmap W %!sudo tee > /dev/null %

" ================== Windows And Splits ==================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" ================== Search ==================
nnoremap / /\v
vnoremap / /\v
set hlsearch
set ignorecase
set smartcase

" Ag
let g:agprg = 'ag --nogroup --nocolor --column --smart-case'
cabbrev Ack AgFromSearch

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" AutoSave
let g:auto_save = 1

" Vim-Json
let g:vim_json_syntax_conceal = 0

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif