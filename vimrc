set nocompatible

" Plugin setup ------ {{{
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin '907th/vim-auto-save'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'bogado/file-line'
Plugin 'elzr/vim-json'
Plugin 'gitignore.vim'
Plugin 'honza/vim-snippets'
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
Plugin 'sjl/badwolf'

" Ruby
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jgdavey/vim-turbux'

" Clojure
Plugin 'amdt/vim-niji'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-scripts/paredit.vim'

call vundle#end()
filetype plugin indent on
" }}}

let mapleader="\<Space>"              " Remap the leader from \ to <Space>

color badwolf

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

" Better commit message
au Filetype gitcommit setlocal spell textwidth=72

" Spelling
source ~/.vim-addons/spelling.vim

au BufNewFile * set noeol

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Resize splits when the window is resized
au VimResized * :wincmd =

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Default text width to 80
if &textwidth == 0
  set textwidth=80
endif
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

" lightline
let g:lightline = {
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ }
    \ }

" Syntastic
let g:syntastic_javascript_checkers = ['eslint', 'jsxhint']

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-X>"
" }}}

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
