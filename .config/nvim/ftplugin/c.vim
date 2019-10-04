" set build options
	let s:c_compiler = "gcc" " clang could also be used
	let s:error_level = "all"
	let s:c_standard = "c11"
	let s:optimization = "0"

" contruct a build command from the options
	let s:build_command = s:c_compiler . " -W" . s:error_level . " -std=" . s:c_standard . " -O" . s:optimization . " -o "

" bind <leader>b to building current file with the specified compiler in the runner pane
	exe "map <leader>b :VtrSendCommandToRunner! " . s:build_command . expand('%:t:r') . " " . expand('%') . "<cr>"

" bind <leader>r to running the current file (if built) in the runner pane
	exe "map <leader>r :VtrSendCommandToRunner! ./" . expand('%:t:r') . "<cr>"

" bind <leader>R to running the current file and then focusing the runner pane
	exe "map <leader>R :VtrSendCommandToRunner! ./" . expand('%:t:r') . "<cr> :TmuxNavigateDown<cr>"

" bind <leader>x to closing the runner pane
	map <leader>x :VtrKillRunner<cr>

" kill the runner when the vim instance is closed
	autocmd VimLeave *.c VtrKillRunner
