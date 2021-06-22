" spacevim bootstrap functions

function! bootstrap#before() abort
  " set coc default sources
  let g:coc_global_extensions = [
  \ 'coc-browser',
  \ 'coc-clangd',
  \ 'coc-git',
  \ 'coc-json',
  \ 'coc-toml'
  \]

  " set doq path
  let g:pydocstring_doq_path = "$HOME/.local/bin/doq"
endfunction

function! bootstrap#after() abort
endfunction
