#!/usr/bin/env sh

# main function to run the arch install
main () {
    echo "Started arch install."

    echo Step 01: install aur helper
    # shellcheck source=./aur-helper.sh
    . "$INSTALL_SCRIPT_DIR/arch/aur-helper.sh"

    echo "Step 02: specify initial config"
    # shellcheck source=./initial-config.sh
    . "$INSTALL_SCRIPT_DIR/arch/initial-config.sh"

    echo "Step 03: install oh-my-zsh"
    # # shellcheck source=./oh-my-zsh.sh
    # . "$INSTALL_SCRIPT_DIR/arch/oh-my-zsh.sh"

    echo "Step 04: clone dotfiles"
    # # shellcheck source=./dotfiles.sh
    # . "$INSTALL_SCRIPT_DIR/arch/dotfiles.sh"
    
    echo "Step 05: install wayland"
    # # shellcheck source=./wayland.sh
    # . "$INSTALL_SCRIPT_DIR/arch/wayland.sh"
    
    echo "Step 06: install desktop environment (GNOME)"
    # # shellcheck source=./desktop-env.sh
    # . "$INSTALL_SCRIPT_DIR/arch/desktop_env.sh"
    
    echo "Step 07: set DE config with gsettings"
    # # shellcheck source=./gsettings.sh
    # . "$INSTALL_SCRIPT_DIR/arch/gsettings.sh"
    
    echo "Step 08: install packages"
    # # shellcheck source=./packages.sh
    # . "$INSTALL_SCRIPT_DIR/arch/packages.sh"

    echo "Step 09: initialize rclone mounts"
    # # shellcheck source=./rclone-mounts.sh
    # . "$INSTALL_SCRIPT_DIR/arch/rclone-mounts.sh"

    echo "Step 10: initialize sonarr-sync"
    # # shellcheck source=./rclone-mounts.sh
    # . "$INSTALL_SCRIPT_DIR/arch/rclone-mounts.sh"
}

main

