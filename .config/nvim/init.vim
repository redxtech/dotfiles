" source some other vim config files.
exe 'source' stdpath('config').'/plugs.vim'
exe 'source' stdpath('config').'/maps.vim'
exe 'source' stdpath('config').'/colours.vim'

" some initial things
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" set vim-vue to use only html, css, & js
let g:vue_pre_processors = []

" set ale to lint & fix js with eslint
let g:ale_linters = { 'javascript': ['eslint'], }
let b:ale_fixers = ['eslint']
let b:ale_fix_on_save = 1

" some asyncrun config
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

" automatically resize vim when window is resized
autocmd VimResized * :wincmd =

" set python version (pyx)
if has('python3')
	set pyx=3
elseif has('python')
	set pyx=3
endif

