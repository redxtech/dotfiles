#!/usr/bin/env sh

# script for starting tmux

main () {
    # save the currect directory to be made into a session name
    SESSION_NAME=$(basename "$PWD" | tr . -)
    
    # if the TMUX variable isn't set, make a new session
    if test -z $TMUX; then
        tmux new-session -As "$SESSION_NAME"
    # otherwise test if a session already exists with the same name
    else
        # if a session with the same name exists, attach to it
        if tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$SESSION_NAME\$"; then
            tmux switch-client -t "$SESSION_NAME"
        # otherwise create a new sessions
        else
            tmux new-session -Ad -s "$SESSION_NAME"
        fi
    fi
}

main
