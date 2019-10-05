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

" mapping function
function! g:Bind(keys, command)
	exe "nnoremap " . a:keys . " " . a:command
endfunction

" map NERDTree toggling
call g:Bind(s:nerdtree, ":NERDTreeToggle<CR>")

" map toggling spellcheck
call g:Bind(s:spellcheck, ":setlocal spell! spelllang=en_us<CR>")

" map replace all
call g:Bind(s:replace_all, ":%s//g<Left><Left>")

" map zoomimg vim buffers
call g:Bind(s:zoom, ":wincmd _<cr>:wincmd \\|<cr>")
call g:Bind(s:unzoom, ":wincmd =<cr>")

