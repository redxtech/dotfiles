#!/usr/bin/env sh

# main function to download yadm and install the dotfiles
main () {
    # start in the home directory
    cd "$HOME" || return 1

    # install git
    sudo pacman -S --noconfirm --quiet git || return 1

    # pull the yadm command to the current folder
    curl -fLo "$HOME/yadm" "https://github.com/TheLocehiliosan/yadm/raw/master/yadm" || return 1

    # make the command executable
    chmod a+x "$HOME/yadm" || return 1

    # TODO: specify the yadm config class for alternate files

    # clone the dotfiles repo
    "$HOME/yadm" clone "https://github.com/redxtech/dotfiles.git" || return 1

    # remove the yadm file
    rm -rf "$HOME/yadm" || return 1

    # return 0 for success
    return 0
}

