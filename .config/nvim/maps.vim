" map Ctrl+n to NERDTree toggling
	map <C-n> :NERDTreeToggle<CR>

" map Ctrl+w & Alt+w to expanding & shrinking visual selected region
	map <C-w> <Plug>(expand_region_expand)
	map <M-w> <Plug>(expand_region_shrink)

" map Ctrl+s to saving the file
	map <C-s> :write<CR>

" map Ctrl+\ to comment out the current line
	map <C-\> <Plug>CommentaryLine

" map <leader>s to toggling spellcheck
	map <leader>s :setlocal spell! spelllang=en_us<CR>

" map replace all to S
	noremap S :%s//g<Left><Left>

