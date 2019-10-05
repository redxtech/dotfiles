" set build options
let s:package_manager = "yarn" " npm could also be used
let s:start = "start"
let s:dev = "dev"
let s:build = "build"
let s:test = "test"

" contruct some commands from the options
let s:build_command = s:package_manager . " " . s:build
let s:run_command = s:package_manager . " " . s:start
let s:dev_command = s:package_manager . " " . s:dev
let s:test_command = s:package_manager . " " . s:test
let s:deps_command = s:package_manager

" bind building of the project
call g:Bind(g:bar_build, ":VtrSendCommandToRunner! " . s:build_command . "<cr>")

" bind running the project
call g:Bind(g:bar_run, ":VtrSendCommandToRunner! " . s:run_command . "<cr>")

" bind running the project and then focusing the runner pane
call g:Bind(g:bar_run_with_focus, ":VtrSendCommandToRunner! " . s:run_command . "<cr>:VtrSelectRunner<cr>")

" bind running the current file
call g:Bind(g:bar_run_specific_file, ":VtrSendCommandToRunner! node " . expand('%:p') . "<cr>")

" bind running the current file with focus
call g:Bind(g:bar_run_specific_file_with_focus, ":VtrSendCommandToRunner! node " . expand('%:p') . "<cr>:VtrSelectRunner<cr>")

" bind running the dev command
call g:Bind(g:bar_dev, ":VtrSendCommandToRunner! " . s:dev_command . "<cr>")

" bind running the test command
call g:Bind(g:bar_test, ":VtrSendCommandToRunner! " . s:test_command . "<cr>")

" bind running the dependency installer command
call g:Bind(g:bar_deps, ":VtrSendCommandToRunner! " . s:deps_command . "<cr>")

" bind closing the runner pane
call g:Bind(g:bar_kill_runner, ":VtrKillRunner<cr>")

" bind attaching a new runner pane
call g:Bind(g:bar_attach, ":VtrAttachToPane<cr>")

" kill the runner when the vim instance is closed
autocmd VimLeave *.js VtrKillRunner

