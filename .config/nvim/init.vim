" i use lua to configure vim now
lua require 'init'

" set theme, might be commented out in order to use pywal theme 
" let g:airline_theme='dracula'

" run packer compile when plugins.lua is saved
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" resize split to 85%
" function! ResizeSplits()
"     set winwidth=85
"     wincmd =
" endfunction

" resize split to 85% on enter
" augroup ReduceNoise
"     autocmd!
"     " Automatically resize active split to 85 width
"     autocmd WinEnter * :call ResizeSplits()
" augroup END
