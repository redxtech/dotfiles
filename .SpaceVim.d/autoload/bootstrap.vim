" spacevim bootstrap functions

function! bootstrap#before() abort
  " set coc default sources
  let g:coc_global_extensions = [
  \ 'coc-browser',
  \ 'coc-git',
  \ 'coc-json',
  \ 'coc-toml'
  \]
endfunction

function! bootstrap#after() abort
endfunction
