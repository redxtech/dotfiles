" source some other vim config files.

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
set splitbelow splitright

" set vim-vue to use only html, css, & js
let g:vue_pre_processors = []

" lint files on fix
let b:ale_fix_on_save = 1

" auto open markdown live preview
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1

" automatically resize vim when window is resized
autocmd VimResized * :wincmd =

" detect if we're on arch (read: main machine)
let s:distro_command = substitute(system('lsb_release -is'), '\n', '', '')
let g:on_main_machine = s:distro_command == "Arch" || s:distro_command == "Garuda"

" detect if node exists
let s:has_node_command = system('command -v node')
let g:has_node = v:shell_error == 0

" load some additional config
try
    source ~/.config/nvim/plugs.vim
    source ~/.config/nvim/maps.vim
    source ~/.config/nvim/colours.vim

    " only load coc if node is available
    if g:has_node
        source ~/.config/nvim/coc.vim
    endif
catch /.*/
    echo "something went wrong loading additional config files"
endtry

