#!/usr/bin/env sh

# function to install a package from the aur
aur_install () {
    echo "Installing $1..."

    # set some directory variables
    AUR_BUILD_DIR="$HOME/.cache/aur_install_dir"
    AUR_PACKAGE_DIR="package"
    CURRENT_DIR="$(pwd)"

    # make sure a program was specified
    if test -z "$1"; then
        echo "No program specified, exiting aur_install."
        return 1
    fi

    # create the build directory if it doesn't exist already and cd into it
    mkdir -p "$AUR_BUILD_DIR"
    cd "$AUR_BUILD_DIR" || return 1

    # clone the git repo
    git clone "https://aur.archlinux.org/$1.git" "$AUR_PACKAGE_DIR"

    # check if the directory is empty
    if test "$(/usr/bin/ls -A "./$AUR_PACKAGE_DIR")"; then
        echo "Cloned repo was empty. Exiting..."
        return 1
    fi

    # cd into the package directory
    cd "./$AUR_PACKAGE_DIR" || return 1

    # install the package with the PKGBUILD
    makepkg -irs --noconfirm --needed

    # assuming successful install, switch back to the previous directory
    cd "$CURRENT_DIR" || return 1

    # return a successful install
    return 0
}

# function to install the required dependencies
install_deps () {
    # run the pacman command to install the packages
    sudo pacman -Sq --noconfirm --needed base-devel git || return 1

    # return a successful install
    return 0
}

# main function to install the aur helper
main () {
    # install general dependencies
    install_deps || return 1

    # install pacaur dependency
    aur_install "auracle-git" || return 1

    # install pacaur
    aur_install "pacaur" || return 1
}

main

