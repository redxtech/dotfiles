#!/usr/bin/env sh

# main function to run the arch install
main () {
    echo "Started arch install."

    echo Step 01: install aur helper
    # shellcheck source=./aur_helper.sh
    . "$INSTALL_SCRIPT_DIR/arch/aur_helper.sh"

    echo "Step 02: specify initial config"
    # # shellcheck source=./initial-config.sh
    # . "$INSTALL_SCRIPT_DIR/arch/initial-config.sh"

    echo "Step 03: install packages"
    # # shellcheck source=./packages.sh
    # . "$INSTALL_SCRIPT_DIR/arch/packages.sh"

    echo "Step 04: install oh-my-zsh"
    # # shellcheck source=./oh-my-zsh.sh
    # . "$INSTALL_SCRIPT_DIR/arch/oh-my-zsh.sh"

    echo "Step 05: clone dotfiles"
    # # shellcheck source=./dotfiles.sh
    # . "$INSTALL_SCRIPT_DIR/arch/dotfiles.sh"
    
    echo "Step 06: next step"
    # # shellcheck source=./.sh
    # . "$INSTALL_SCRIPT_DIR/arch/.sh"
}

main

