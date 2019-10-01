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

" enable autocompletion
	set wildmode=longest,list,full

" set vim-vue to use only html, css, & js
	let g:vue_pre_processors = []

" set ale to lint js with eslint
	let g:ale_linters = { 'javascript': ['eslint'], }

