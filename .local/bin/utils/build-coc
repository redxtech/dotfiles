#!/usr/bin/env sh

main () {

    # preserve current directory
    _CWD="$(pwd)"

    # loop through each plugin folder and run yarn --install
    # shellcheck disable=SC2231
    for dir in $HOME/.local/share/nvim/plugged/coc-*; do
        cd "$dir" || return
        yarn install
    done

    # reset current directory
    cd "$_CWD" || return
}

main

