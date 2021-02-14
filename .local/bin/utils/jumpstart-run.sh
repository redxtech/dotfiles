#!/usr/bin/env sh

main () {
    JS_BASE="$HOME/.local/dotfiles/arch-jumpstart"
    export JS_BASE

    RUN_FILE="$JS_BASE/scripts/$(fd -d 1 -e sh . "$JS_BASE/scripts/" | sed 's|.*/||' | fzf)"

    if test -f "$RUN_FILE"; then
        echo "Running $RUN_FILE..."
        sh "$RUN_FILE"
    else
        echo "$RUN_FILE not found"
    fi
}

main

