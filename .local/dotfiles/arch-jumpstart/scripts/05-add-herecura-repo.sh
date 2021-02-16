#!/usr/bin/env sh

# append the repo to pacman.conf
main () {
    
    # check that the repo isn't already installed
    if grep herecura /etc/pacman.conf; then
        echo "Herecura already added!"
    else
        # shellcheck disable=SC2024
        sudo tee -a /etc/pacman.conf < "$JS_BASE/files/herecura.txt" >/dev/null

        # reload pacman database
        sudo pacman -Sy
    fi
}

main

