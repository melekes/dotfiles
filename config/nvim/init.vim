set nocompatible                      " be iMproved, required
filetype off                          " required

call plug#begin('~/.vim/plugged')

Plug '907th/vim-auto-save'
Plug 'Chun-Yang/vim-action-ag'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'benmills/vimux'
Plug 'bogado/file-line'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'gitignore.vim'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'kana/vim-textobj-user'
Plug 'mhinz/vim-startify'
Plug 'nelstrom/vim-visual-star-search'
Plug 'reedes/vim-lexical'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sickill/vim-pasta'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" Themes
Plug 'altercation/vim-colors-solarized'
" Plug 'junegunn/seoul256.vim'

" Ruby
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'jgdavey/vim-turbux'

" Clojure
" Plug 'raymond-w-ko/vim-niji'
" Plug 'tpope/vim-fireplace'
" Plug 'vim-scripts/paredit.vim'

" Erlang
Plug 'edkolev/erlang-motions.vim'
Plug 'akalyaev/vim-erlang-spec'

" Haskell
"Plug 'yogsototh/haskell-vim'
"Plug 'Shougo/vimproc'
"Plug 'eagletmt/ghcmod-vim'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on             " required

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
set shiftround
set smartindent                       " Smart auto-indent when creating a new line
set colorcolumn=80
set synmaxcol=300                     " The max number of columns to try and highlight
set ttyfast                           " Optimize for fast terminal connections
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
set wildignore+=tags
set tags+=.git/tags
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_  " Show “invisible” characters
set nojoinspaces                      " Don't add 2 spaces when using J

set clipboard+=unnamedplus

" Custom Mappings ------ {{{
" Quick ESC
inoremap jk <ESC>

" Select entire file
nnoremap <leader>vef ggV`]

" Format entire file
nmap <leader>fef ggVG=

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

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
au vimrc Filetype gitcommit setlocal spell

au vimrc BufNewFile * set noeol

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Resize splits when the window is resized
au vimrc VimResized * :wincmd =

" Automatically removing all trailing whitespace
au vimrc BufWritePre * :%s/\s\+$//e

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

" CtrlP
let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

let g:ctrlp_map = '<leader>f'
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>r :CtrlPMRU<CR>
nmap <leader>hl :CtrlPLastMode<CR>

" AutoSave
let g:auto_save = 0
" let g:auto_save_in_insert_mode = 0
" let g:auto_save_silent = 1

" Vim-Json
let g:vim_json_syntax_conceal = 0

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map  <Tab> <Plug>(easymotion-bd-f)
nmap <Tab> <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>

" lightline
let g:lightline = {
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ }
    \ }

" Syntastic
let g:syntastic_erlang_checkers = ['syntaxerl']

" Ag
let g:ag_prg = 'ag --nogroup --nocolor --column --smart-case'
nmap <leader>/ :Ag<Space>

" vim-action-ag
nmap <leader>s <Plug>AgAction
vmap <leader>s <Plug>AgActionVisual

" Vimux
nmap <leader>v <Plug>VimuxRunLastCommand

" vim-lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spelllang = ['en_us', 'ru_ru']

" ctrlsf.vim
nmap <leader>sf <Plug>CtrlSFPrompt
vmap <leader>sf <Plug>CtrlSFVwordExec

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let test#strategy = "vimux"

" Neomake
autocmd! BufWritePost * Neomake

let g:neomake_erlang_erlc_maker = {
      \ 'args': ['-I src/records']
      \ }
" }}}

" Local config
if filereadable($HOME . "/.config/nvim/init.vim.local")
  source ~/.config/nvim/init.vim.local
endif
