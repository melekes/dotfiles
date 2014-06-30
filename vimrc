set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" My Bundles
Plugin '907th/vim-auto-save'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'bogado/file-line'
Plugin 'elzr/vim-json'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

" Themes
Plugin 'junegunn/seoul256.vim'
Plugin 'sjl/badwolf'

" Ruby
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" Clojure
Plugin 'amdt/vim-niji'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-leiningen'
Plugin 'vim-scripts/paredit.vim'

call vundle#end()
filetype plugin indent on

let mapleader=","

color badwolf

set autoread                          " Reload files changed outside vim
set cursorline                        " Highlight current line
set expandtab
set modeline                          " Respect modeline in files
set tabstop=2                         " Make tabs as wide as two spaces
set softtabstop=2
set shiftwidth=2
set colorcolumn=85
set synmaxcol=128
set ttyfast                           " Optimize for fast terminal connections
set ttyscroll=10
set encoding=utf-8
set nowrap                            " Don't wrap lines
set number                            " Enable line numbers
set relativenumber
set nowritebackup
set noswapfile
set nobackup
set hidden
set scrolloff=8                       " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set autoindent
set complete=.,b,u,]
set completeopt=menu,preview
set wildmode=list:longest,list:full
set wildmenu                          " Enhance command-line completion
set wildignore+=tags,gems.tags
set tags+=gems.tags
set clipboard=unnamedplus
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_  " Show “invisible” characters

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

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Resize splits when the window is resized
au VimResized * :wincmd =

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

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
set hlsearch    " Highlight searches
set ignorecase  " Ignore case of searches
set smartcase

" Ag
let g:agprg = 'ag --nogroup --nocolor --column --smart-case'
cabbrev Agfs AgFromSearch

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" AutoSave
let g:auto_save = 1

" Vim-Json
let g:vim_json_syntax_conceal = 0

" EasyMotion
let g:EasyMotion_leader_key = ';'

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" MiniBufExplorer
nmap <Leader>m :MBEFocus<cr>
let g:miniBufExplBRSplit = 0 "Always stick to the edge
let g:miniBufExplMaxSize = 1 "Set maximum height to 1 line

" lightline
let g:lightline = {
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ }
    \ }

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
