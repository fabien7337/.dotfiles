"""""""""""""""""""" PLUGINS
set nocompatible      " We're running Vim, not Vi!
filetype off
set clipboard=unnamed " Enable copy/paste outside vim
syntax on             " Enable syntax highlighting

""" Installation:
""" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""" git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-Commenter'
Plugin 'Lokaltog/vim-powerline'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-rails'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""" GLOBAL
" set background=dark
let mapleader=","
colorscheme molokai
" colorscheme railscasts
" colorscheme codeschool
" colorscheme base16-default

syntax on
set encoding=utf-8
set showcmd
set nowrap
set autoindent "Indenting source code
set copyindent
set number
set wildignore=*.swp,*.bak
set title
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set expandtab
set softtabstop=2 tabstop=2 shiftwidth=2
set ruler

"""""""""""""""""""" PLUGINS
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-o>'
nmap <silent> <leader>d <Plug>DashSearch
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

"""""""""""""""""""" STATUSBAR

hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
hi PatchColor ctermfg=255 ctermbg=161 guifg=black guibg=#FF0066

function! MyStatusLine(mode)
  let statusline=""

  if a:mode == 'Enter'
    let statusline.="%#StatColor#"
  endif
  let statusline.="\(%n\)\ %f\ "
  if a:mode == 'Enter'
    let statusline.="%*"
  endif
  let statusline.="%#Modified#%m"
  if a:mode == 'Leave'
    let statusline.="%*%r"
  elseif a:mode == 'Enter'
    let statusline.="%r%*"
  endif
  let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
  return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>120v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>120v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
