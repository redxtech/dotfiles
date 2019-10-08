" define build & run bindings
let g:bar_build = "<leader>b"
let g:bar_run = "<leader>r"
let g:bar_run_with_focus = "<leader>R"
let g:bar_run_specific_file = "<leader>rr"
let g:bar_run_specific_file_with_focus = "<leader>RR"
let g:bar_dev = "<leader>d"
let g:bar_test = "<leader>t"
let g:bar_deps = "<leader>deps"
let g:bar_kill_runner = "<leader>x"
let g:bar_attach = "<leader>a"

" define some mapping keys
let s:nerdtree = "<C-n>" 
let s:replace_all = "S"
let s:spellcheck = "s"
let s:zoom = "<leader>-"
let s:unzoom = "<leader>="
let s:noh = "<leader>c"
let s:delete_line = "<C-x>"
let s:region_expand = "<C-w>"
let s:region_shrink = "<M-w>"
let s:yank_list = "<leader>y"
let g:coc_snippet_next = '<c-j>'

" mapping function
function! g:Bind(keys, command)
	exe "nnoremap " . a:keys . " " . a:command
endfunction

" bind NERDTree toggling
call g:Bind(s:nerdtree, ":NERDTreeToggle<CR>")

" bind toggling spellcheck
call g:Bind(s:spellcheck, ":setlocal spell! spelllang=en_us<CR>")

" bind replace all
call g:Bind(s:replace_all, ":%s//g<Left><Left>")

" bind nohlsearch
call g:Bind(s:noh, ":noh<cr>")

" bind delete line
call g:Bind(s:delete_line, 'dd')

" bind zoomimg vim buffers
call g:Bind(s:zoom, ":wincmd _<cr>:wincmd \\|<cr>")
call g:Bind(s:unzoom, ":wincmd =<cr>")

" bind expand selection
exe "xnoremap " . s:region_expand . " <Plug>(expand_region_expand)"
exe "xnoremap " . s:region_shrink . " <Plug>(expand_region_shrink)"

" bind showing a list of yanks
exe "nnoremap <silent> " . s:yank_list . " :<C-u>CocList -A --normal yank<cr>"
