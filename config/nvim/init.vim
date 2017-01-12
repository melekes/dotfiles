filetype off                          " required

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim', { 'on': ['SidewaysLeft', 'SidewaysRight'] }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'FooSoft/vim-argwrap'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'benmills/vimux'
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
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'kana/vim-textobj-user'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'nelstrom/vim-visual-star-search'
Plug 'reedes/vim-lexical'
Plug 'ryanoasis/vim-devicons' " requires https://github.com/ryanoasis/nerd-fonts or patched font
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sickill/vim-pasta'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'

" Distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Themes
" Plug 'altercation/vim-colors-solarized'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'morhetz/gruvbox'

Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'tpope/vim-endwise',              { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby',              { 'for': 'ruby' }

Plug 'guns/vim-clojure-static',      { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure', 'on': ['RainbowParenthesesToggle', 'RainbowParenthesesLoadRound', 'RainbowParenthesesLoadSquare', 'RainbowParenthesesLoadBraces'] }
Plug 'tpope/vim-fireplace',          { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim',      { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt',         { 'for': 'clojure' }

Plug 'akalyaev/vim-erlang-spec',      { 'for': 'erlang' }
Plug 'edkolev/erlang-motions.vim',    { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }

Plug 'Shougo/vimproc',            { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim',       { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'fatih/vim-go', { 'for': 'go' }

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on             " required

let mapleader      = ' '

if has("termguicolors")
  set termguicolors
endif

syntax enable
set background=dark
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
set autowriteall                      " Write the contents of the file as frequent as possible

set clipboard+=unnamedplus

" Custom Mappings ------ {{{
" Quick ESC
inoremap jk <ESC>

" Save
nnoremap <leader>s :update<cr>

" Quit
nnoremap <leader>q :quit<cr>

" Select entire file
nnoremap <leader>vef ggV`]

" Select text you just pasted
noremap gV `[v`]

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

" Open current line on Stash
" nnoremap <leader>ou :!echo `git url`/%?at=`git rev-parse HEAD`\#<C-R>=line('.')<CR> \| xargs open<CR><CR>

" Open current line on Github
nnoremap <leader>ou :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

augroup vimrc
  autocmd!
augroup END

" Better commit message
au vimrc Filetype gitcommit setlocal spell

au vimrc BufNewFile * set noeol

" Sudo write
noremap <leader>S :w !sudo tee %<CR>

" Resize splits when the window is resized
au vimrc VimResized * :wincmd =

" Automatically removing all trailing whitespace
au vimrc BufWritePre * :%s/\s\+$//e

au vimrc Filetype erlang setlocal tabstop=4 softtabstop=4 shiftwidth=4

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
" See https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>r :History<CR>
nmap <leader>gf :GitFiles<CR>
nmap <leader>/ :Ag <C-R><C-W><CR>

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

" Sideways
nmap <leader>l :SidewaysLeft<CR>
nmap <leader>h :SidewaysRight<CR>

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-clojure-highlight
au VimEnter *       RainbowParenthesesToggle
au Syntax   clojure RainbowParenthesesLoadRound
au Syntax   clojure RainbowParenthesesLoadSquare
au Syntax   clojure RainbowParenthesesLoadBraces

" ArgWrap
nnoremap <silent> <leader>w :ArgWrap<CR>

" limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
au FileType go nmap gd <Plug>(go-def)
let g:go_auto_type_info = 1
" }}}

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Local config
if filereadable($HOME . "/.config/nvim/init.vim.local")
  source ~/.config/nvim/init.vim.local
endif
