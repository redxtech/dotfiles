#! /usr/bin/env fish

source "$HOME/.local/bin/install/arch/aur_install.fish"

# function to setup the arch installation of the dotfiles
function arch_setup
    # install auracle-git
    aur_install auracle-git

    # install pacaur
    aur_install pacaur

    return 0
end

