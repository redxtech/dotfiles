#!/usr/bin/env sh

# check if the operating system is linux
is_linux () {
    [ "$(uname)" = "Linux" ]
}

# check if the spotifycli command exists
has_spotify_cli () {
    type spotifycli >/dev/null 2>&1
}

# if on linux and spotifycli exists, show the message
spotify_msg () {
    if is_linux; then
        if has_spotify_cli; then
            spotifycli "$1"
        else
            echo "error: tm_spotify needs spotify-cli linux (pip)"
        fi
    else
        echo "error: tm_spotify only works on linux"
    fi
}


