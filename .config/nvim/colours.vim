"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
let g:lightline = { 'colorscheme': 'onedark' }

colorscheme onedark

