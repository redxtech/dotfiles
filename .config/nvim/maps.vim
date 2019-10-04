" map Ctrl+n to NERDTree toggling
	map <C-n> :NERDTreeToggle<CR>

" map Ctrl+w & Alt+w to expanding & shrinking visual selected region
	" map <C-w> <Plug>(expand_region_expand)
	" map <M-w> <Plug>(expand_region_shrink)

" map Ctrl+s to saving the file
	map <C-s> :write<CR>

" map Ctrl+\ to comment out the current line
	map <C-\> <Plug>CommentaryLine

" map <leader>s to toggling spellcheck
	map <leader>s :setlocal spell! spelllang=en_us<CR>

" map replace all to S
	noremap S :%s//g<Left><Left>

" map F9 to building the current file with gcc
	noremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" map F5 to running the current file
	noremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" map F10 to opening the asyncrun window
	nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

