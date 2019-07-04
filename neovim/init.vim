" ######################################################################################################################
" ## Author : Martin Toma <martin.toma.svk@gmail.com>                                                               ###
" ######################################################################################################################
" ### Neovim Configuration focused on Web development                                                                ###
" ### Neovimmer since : Tue Oct 14 2014                                                                              ###
" ### Vimmer since    : Tue Nov 12 2013                                                                              ###
" ######################################################################################################################

" ======================================================================================================================
" Plugin manager (Plug) settings
" ======================================================================================================================
"{{{

" Autoinstall {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
" }}}
call plug#begin('~/.config/nvim/plugged')

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin list
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ---------------------------------------------------------------------------------------------------------------------
" Language agnostic plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Asynchronous maker and linter (needs linters to work)
Plug 'neomake/neomake', { 'on': ['Neomake'] }
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Ruby/Rails {{{
" ---------------------------------------------------------------------------------------------------------------------

" Ruby support (plays nicely with tpope/rbenv-ctags)
Plug 'vim-ruby/vim-ruby'
" Haml syntax
Plug 'tpope/vim-haml'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" JS (ES6, React) {{{
" ---------------------------------------------------------------------------------------------------------------------

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
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" HTML/CSS {{{
" ---------------------------------------------------------------------------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other languages {{{
" ---------------------------------------------------------------------------------------------------------------------

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
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" External tools integration plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Fuzzy searching/replacing/etc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------------------------------------------------------------------------

"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Extra text objects {{{
" ---------------------------------------------------------------------------------------------------------------------

"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes {{{
" ---------------------------------------------------------------------------------------------------------------------

" Gruvbox
Plug 'morhetz/gruvbox'
" Tender
Plug 'jacoborus/tender.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other {{{
" ---------------------------------------------------------------------------------------------------------------------

"}}}

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

" ======================================================================================================================
" Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ======================================================================================================================
"{{{

set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
scriptencoding utf-8                        " Set utf-8 as default script encoding
set clipboard+=unnamedplus                  " Allow to use system clipboard
set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers on
set noshowmode                              " Never show mode
set showcmd                                 " Show commands as you type them
set expandtab                               " Replace tabs by white spaces characters
set shiftwidth=2                            " Makes the tabulations be 2 white spaces
set nornu
set number

" ---------------------------------------------------------------------------------------------------------------------
" Split settings (more natural) {{{
" ---------------------------------------------------------------------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Search settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Persistent undo settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Neovim specific settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('nvim')
  let g:loaded_python_provider=1                        " Disable python 2 interface
  let g:python_host_skip_check=1                        " Skip python 2 host check
  let g:python3_host_prog='/usr/local/bin/python3'      " Set python 3 host program
  set inccommand=nosplit                                " Live preview of substitutes and other similar commands
endif
"}}}

" -----------------------------------------------------
" True colors settings {{{
" -----------------------------------------------------
if has('termguicolors')
  set termguicolors " Turn on true colors support
endif
"}}}

" -----------------------------------------------------
" Language settings {{{
" -----------------------------------------------------
let $LANG = 'en_US'
"}}}

" ======================================================================================================================
" Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" Setting leader {{{
" -----------------------------------------------------
let g:mapleader=","
let mapleader=","
"}}}

" -----------------------------------------------------
" Custom commands and functions {{{
" -----------------------------------------------------

command! Retab2 :call utils#retabToTwoSpaces()
"}}}

"}}}

" ======================================================================================================================
" Plugins settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" FZF {{{
" -----------------------------------------------------
nnoremap <C-p> :Files<CR>

" -----------------------------------------------------
" NERDTree {{{
" -----------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
"}}}

" -----------------------------------------------------
" Buftabline {{{
" -----------------------------------------------------
let g:buftabline_show = 2       " Always show
let g:buftabline_numbers = 2    " Ordinal from left-to-right
"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings
" ======================================================================================================================
"{{{
" Syntax highlighting {{{
syntax on
"}}}

" Color scheme {{{
set background=dark
colorscheme gruvbox
"}}}

" Highlight VCS conflict markers {{{
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

" Highlight term cursor differently {{{
highlight TermCursor ctermfg=green guifg=green
"}}}

" Remove underline in folded lines {{{
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" Link highlight groups to improve buftabline colors {{{
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment
"}}}

"}}}

