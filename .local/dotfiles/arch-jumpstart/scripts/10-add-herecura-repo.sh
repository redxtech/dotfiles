#!/usr/bin/env sh

# append the repo to pacman.conf
main () {
    # shellcheck disable=SC2024
    sudo tee -a /etc/pacman.conf < "$JS_BASE/../files/herecura.txt"
}

main

