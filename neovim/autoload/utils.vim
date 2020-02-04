" Informative echo line
function! g:utils#showToggles() abort
  echom '<F1> NERDTree | <F2> Free | <F3> Free | <F4> Spellcheck | <F5> Reload rc | <F6> Search HL |' .
        \' <F7> Whitechars | <F8> Built-in terminal | <F9> Free | <F10> Free  | <F11> Free |' .
        \' <F12> This message'
endfunction

" Strip trailing spaces
function! g:utils#stripTrailingWhitespaces() abort
  " Preparation: save last search, and cursor position.
  let l:lastSearch = @/
  let l:line = line('.')
  let l:col = col('.')

  " Do the business:
  execute '%s/\s\+$//e'

  " Clean up: restore previous search history, and cursor position
  let @/ = l:lastSearch
  call cursor(l:line, l:col)
endfunction

" Reset tabs to 2 spaces
function! g:utils#retabToTwoSpaces() abort
  setlocal tabstop=2 shiftwidth=2 expandtab
  retab
endfunction
