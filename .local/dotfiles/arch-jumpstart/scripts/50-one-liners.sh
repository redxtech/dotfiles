#!/usr/bin/env sh

link_dash () {
    echo "Symlinking /usr/bin/sh to dash..."
    if command -v dash >/dev/null; then
        sudo ln -sfT dash /usr/bin/sh
    else
        echo "Dash not installed!"
    fi
}

main () {
    link_dash
}

main

