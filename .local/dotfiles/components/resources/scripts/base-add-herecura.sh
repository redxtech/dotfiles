#!/usr/bin/env sh

# append the repo to pacman.conf
main () {
    
    # check that the repo isn't already installed
    if grep -q herecura /etc/pacman.conf; then
        echo "Herecura already added!"
    else
        # shellcheck disable=SC2024
        printf "# Custom servers\n[herecura]\nServer = https://repo.herecura.be/\$repo/\$arch" \
            | sudo tee -a /etc/pacman.conf >/dev/null

        # reload pacman database
        sudo pacman -Sy
    fi
}

main


