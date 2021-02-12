#!/usr/bin/env sh

# append the repo to pacman.conf
main () {
    # shellcheck disable=SC2024
    sudo tee -a /etc/pacman.conf < "$JS_BASE/../files/herecura.txt"

    # reload pacman database
    sudo pacman -Sy
}

main

