" source some other vim config files.
exe 'source' stdpath('config').'/plugs.vim'
exe 'source' stdpath('config').'/maps.vim'
exe 'source' stdpath('config').'/coc.vim'
exe 'source' stdpath('config').'/colours.vim'

" some initial things
set nocompatible
set exrc
set secure
set expandtab
filetype plugin on
syntax on
set nobackup
set nowritebackup
set encoding=utf-8
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set updatetime=300
set signcolumn=yes

" set vim-vue to use only html, css, & js
let g:vue_pre_processors = []

" lint files on fix
let b:ale_fix_on_save = 1

" automatically resize vim when window is resized
autocmd VimResized * :wincmd =

