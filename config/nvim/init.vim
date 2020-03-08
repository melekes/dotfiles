filetype off                          " required

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim', { 'on': ['SidewaysLeft', 'SidewaysRight'] }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'FooSoft/vim-argwrap'
Plug 'RRethy/vim-illuminate'
Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'kana/vim-textobj-user'
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'nelstrom/vim-visual-star-search'
Plug 'reedes/vim-lexical'
Plug 'rizzatti/dash.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sickill/vim-pasta'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'zivyangll/git-blame.vim'
Plug 'zxqfl/tabnine-vim', { 'on': ['TabNine'] }

" Completion
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

" Distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Themes
" Plug 'altercation/vim-colors-solarized'
" Plug 'frankier/neovim-colors-solarized-truecolor-only'
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'
"

Plug 'sheerun/vim-polyglot'

Plug 'vim-ruby/vim-ruby',              { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'tpope/vim-endwise',              { 'for': 'ruby' }

Plug 'guns/vim-clojure-static',      { 'for': 'clojure' }
Plug 'luochen1990/rainbow',          { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',          { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim',      { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt',         { 'for': 'clojure' }

Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
Plug 'melekes/vim-erlang-spec',      { 'for': 'erlang' }
Plug 'edkolev/erlang-motions.vim',    { 'for': 'erlang' }

Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Shougo/vimproc',            { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim',       { 'for': 'haskell' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'fatih/vim-go',      { 'for': 'go' }
Plug 'buoto/gotests-vim', { 'for': 'go' }

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on             " required

let mapleader      = ' '
let maplocalleader = ","

if has("termguicolors")
  set termguicolors
endif

syntax enable
" set background=dark
colorscheme onedark

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
set nowritebackup                     " Don't create a backup when overwriting a file
set noswapfile                        " Don't write swap files
set nobackup                          " Don't keep backup files
set hidden
set scrolloff=5                       " Lines the cursor is to the edge before scrolling
set complete-=i                       " set complete=.,w,b,u,t
" Affects the visual representation of what happens after you hit <C-x><C-o>
" https://neovim.io/doc/user/insert.html#i_CTRL-X_CTRL-O
" https://neovim.io/doc/user/options.html#'completeopt'
"
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect
set wildmenu
set wildmode=full
set tags+=.git/tags
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_  " Show “invisible” characters
set nojoinspaces                      " Don't add 2 spaces when using J
set autowriteall                      " Write the contents of the file as frequent as possible
set grepprg=rg\ --vimgrep             " Use rg as grep program

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

" Autosave buffers before leaving them
au BufLeave * silent! :wa

" Automatically removing all trailing whitespace
au vimrc BufWritePre * :%s/\s\+$//e

au vimrc Filetype erlang setlocal tabstop=4 softtabstop=4 shiftwidth=4

" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
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

" WhichKey
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" LanguageClient
let g:LanguageClient_serverCommands = {
      \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
      \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ 'go': ['gopls'],
      \ }
nnoremap <silent> <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
set completefunc=LanguageClient#complete

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
      \ },
      \ 'colorscheme': 'solarized',
      \ }

" Vimux
nmap <leader>vp :call VimuxPromptCommand()<CR>
nmap <leader>vl :call VimuxRunLastCommand()<CR>
nmap <leader>vi :call VimuxInspectRunner()<CR>
nmap <leader>vz :call VimuxZoomRunner()<CR>

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

let g:neomake_erlang_erlc_maker = {
      \ 'args': ['-I src/records']
      \ }

" fzf :heart: vim
" --files: List files that would be searched but do not search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>r :History<CR>
nmap <leader>gf :GitFiles<CR>
nmap <leader>/ :Rg <C-R><C-W><CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Status line (neovim)
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
nmap <localleader>l :SidewaysLeft<CR>
nmap <localleader>h :SidewaysRight<CR>

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" rainbow
let g:rainbow_active = 1

" ArgWrap
nmap <silent> <leader>w :ArgWrap<CR>

" limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
au FileType go nmap gd <Plug>(go-def)
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

" let g:go_metalinter_enabled = ['vet', 'vetshadow', 'golint', 'deadcode', 'varcheck', 'structcheck', 'ineffassign', 'interfacer', 'unconvert', 'goconst', 'gosimple', 'staticcheck']
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_autosave = 1


" git-blame
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" ale
let g:ale_linters = {
      \ 'go': ['gopls'],
      \}
let g:ale_fix_on_save = 1

" AutoFormat
autocmd BufWrite * :Autoformat

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
