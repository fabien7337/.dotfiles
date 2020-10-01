" Plugin manager (Plug) settings
" ------------------------------

" Autoinstall
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
call plug#begin('~/.config/nvim/plugged')


" Language agnostic plugins
" -------------------------

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-surround'

" add end, endif, etc. automatically
Plug 'tpope/vim-endwise'

" context-aware pasting
Plug 'sickill/vim-pasta'


" Language agnostic plugins
" -------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'neomake/neomake', { 'on': ['Neomake'] }
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Commenting support (gc)
Plug 'tpope/vim-commentary'


" Ruby/Rails
" ----------

" Ruby support (plays nicely with tpope/rbenv-ctags)
Plug 'vim-ruby/vim-ruby'
" Haml syntax
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
" Rails syntax
Plug 'tpope/vim-rails'


" JS (ES6, React)
" ---------------

" Modern JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'
" JSX syntax
Plug 'mxw/vim-jsx'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
" Autocomplete (npm install -g tern)
Plug 'carlitux/deoplete-ternjs'
" JS Documentation comments
Plug 'heavenshell/vim-jsdoc', { 'on': ['JsDoc'] }


" HTML/CSS
" --------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }


" Other languages
" ---------------

" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Tmux syntax
Plug 'keith/tmux.vim'
" Dockerfile
Plug 'honza/dockerfile.vim'


" Interface improving
" -------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'


" External tools integration plugins
" ----------------------------------

" Fuzzy searching/replacing/etc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'


" Text insertion/manipulation
" ---------------------------


" Extra text objects
" ------------------


" Colorschemes
" ------------

" Gruvbox
Plug 'morhetz/gruvbox'
" Tender
Plug 'jacoborus/tender.vim'


" End of plugin
" -------------
call plug#end()

" ======================================================================================================================



" Basic settings
" --------------

set encoding=utf-8              " The encoding displayed.
set fileencoding=utf-8          " The encoding written to file.
scriptencoding utf-8            " Set utf-8 as default script encoding
set clipboard+=unnamedplus
set shell=/bin/zsh              " Setting shell to zsh
set number                      " Line numbers on
set so=7				                " set 7 lines to the cursors - when moving vertical
set noshowmode                  " Never show mode
set showcmd                     " Show commands as you type them
set expandtab                   " Replace tabs by white spaces characters
set shiftwidth=2                " Makes the tabulations be 2 white spaces
set tabstop=2
set softtabstop=2
set autoindent
set copyindent
set nornu
set number
set autoread				            " detect when a file is changed
set scrolloff=5                 " Scroll when closing to top or bottom of the screen


" Split settings (more natural)
" -----------------------------

set splitbelow                  " Splitting a window will put the new window below the current
set splitright                  " Splitting a window will put the new window right of the current


" Search settings
" ---------------

set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search


" Persistent undo settings
" ------------------------

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif


" Neovim specific settings
" ------------------------

if has('nvim')
  let g:loaded_python_provider=1                        " Disable python 2 interface
  let g:python_host_skip_check=1                        " Skip python 2 host check
  let g:python3_host_prog='/usr/bin/python3.8'          " Set python 3 host program
  set inccommand=nosplit                                " Live preview of substitutes and other similar commands
endif


" True colors settings
" --------------------

if has('termguicolors')
  set termguicolors     " Turn on true colors support
endif


" Language settings
" -----------------

let $LANG = 'en_US'


" Setting leader
" --------------

let g:mapleader=","
let mapleader=","


" Custom commands and functions
" -----------------------------

command! Retab2 :call utils#retabToTwoSpaces()


" Deoplete
" --------

let g:deoplete#enable_at_startup=1


" FZF
" ---

if isdirectory(".git")
  " if in a git project, use :GFiles
  nmap <silent> <leader>p :GitFiles --cached --others --exclude-standard<cr>
else
  " otherwise, use :FZF
  nmap <silent> <leader>p :FZF<cr>
endif


" NERDTree
" --------

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1


" Buftabline
" ----------

let g:buftabline_show = 2       " Always show
let g:buftabline_numbers = 2    " Ordinal from left-to-right
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(0)
nmap <leader>w :w<cr>
nmap <leader>q :bd<cr>


" Syntax & Color scheme
" ---------------------

syntax on
set background=dark
colorscheme gruvbox

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

" Link highlight groups to improve buftabline colors
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment

nnoremap <leader>m :call utils#showToggles()<CR>

augroup strip_ws
  autocmd BufWritePre * call utils#stripTrailingWhitespaces()
augroup END
