call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'benmills/vimux'
Plug 'bogado/file-line'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'gitignore.vim'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user'
Plug 'mhinz/vim-startify'
Plug 'nelstrom/vim-visual-star-search'
Plug 'reedes/vim-lexical'
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
Plug 'vim-scripts/ReplaceWithRegister'

" Themes
Plug 'altercation/vim-colors-solarized'
" Plug 'junegunn/seoul256.vim'

" Ruby
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Clojure
Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

" Erlang
Plug 'edkolev/erlang-motions.vim', { 'for': 'erlang' }
Plug 'akalyaev/vim-erlang-spec', { 'for': 'erlang' }

" Haskell
Plug 'yogsototh/haskell-vim', { 'for': 'haskell' }
Plug 'Shougo/vimproc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

" Add plugins to &runtimepath
call plug#end()

let mapleader      = ' '
let maplocalleader = ' '

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
set complete-=i                       " set complete=.,w,b,u,t
set completeopt=menu,preview
set wildmenu
set wildmode=full
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

" Vim-Json
let g:vim_json_syntax_conceal = 0

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map  <Tab> <Plug>(easymotion-bd-f)
nmap <Tab> <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" lightline
let g:lightline = {
    \ 'active': {
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ }
    \ }

" Syntastic
let g:syntastic_erlang_checkers = ['syntaxerl']

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

" fzf :heart: vim
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>r :History<CR>
nmap <leader>gf :GitFiles<CR>
nmap <leader>/ :Ag<Space>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Vim Tmux Navigator
let g:tmux_navigator_save_on_switch = 1

" }}}

" Local config
if filereadable($HOME . "/.config/nvim/init.vim.local")
  source ~/.config/nvim/init.vim.local
endif
