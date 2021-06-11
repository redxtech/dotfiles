" spacevim bootstrap functions

function! bootstrap#before() abort
  " set coc default sources
  let g:coc_global_extensions = [
  \ 'coc-browser',
  \ 'coc-json',
  \ 'coc-git'
  \]
endfunction

function! bootstrap#after() abort
endfunction
