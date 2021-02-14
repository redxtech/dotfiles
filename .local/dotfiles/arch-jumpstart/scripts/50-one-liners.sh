#!/usr/bin/env sh

link_dash () {
    if command -v dash >/dev/null; then
        sudo ln -sf /usr/bin/dash /usr/bin/sh
    else
        echo "Dash not installed!"
    fi
}

main () {
    link_dash
}

main

