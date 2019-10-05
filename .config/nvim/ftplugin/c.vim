" set build options
let s:c_compiler = "gcc" " clang could also be used
let s:error_level = "all"
let s:c_standard = "c11"
let s:optimization = "0"

" contruct a build command from the options
let s:build_command = s:c_compiler . " -W" . s:error_level . " -std=" . s:c_standard . " -O" . s:optimization . " -o "

" bind building of current file with the specified compiler in the runner pane
call g:Bind(g:bar_build, ":VtrSendCommandToRunner! " . s:build_command . expand('%:t:r') . " " . expand('%') . "<cr>")

" bind running the current file (if built) in the runner pane
call g:Bind(g:bar_run, ":VtrSendCommandToRunner! ./" . expand('%:t:r') . "<cr>")

" bind running the current file and then focusing the runner pane
call g:Bind(g:bar_run_with_focus, ":VtrSendCommandToRunner! ./" . expand('%:t:r') . "<cr> :VtrSelectRunner<cr>")

" bind closing the runner pane
call g:Bind(g:bar_kill_runner, ":VtrKillRunner<cr>")

" bind attaching a new runner pane
call g:Bind(g:bar_attach, ":VtrAttachToPane<cr>")

" kill the runner when the vim instance is closed
autocmd VimLeave *.c VtrKillRunner

