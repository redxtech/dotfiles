" i use lua to configure vim now
lua require 'init'

" set theme, might be commented out in order to use pywal theme 
" let g:airline_theme='dracula'

" run packer compile when plugins.lua is saved
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

