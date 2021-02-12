#!/usr/bin/env sh

# function to install a package from the aur
aur_install () {
    echo "Installing $1..."

    # set some directory variables
    AUR_BUILD_DIR="$HOME/.cache/aur_install_dir"
    AUR_PACKAGE_DIR="$AUR_BUILD_DIR/package"
    AUR_PKGBUILD="$AUR_PACKAGE_DIR/PKGBUILD"
    CURRENT_DIR="$(pwd)"

    # make sure a program was specified
    if test -z "$1"; then
        echo "No program specified, exiting aur_install."
        return 1
    fi

    # clean & create the build directory then cd into it
    rm -rf "$AUR_BUILD_DIR"
    mkdir -p "$AUR_BUILD_DIR"
    cd "$AUR_BUILD_DIR" || return 1

    # clone the git repo
    git clone "https://aur.archlinux.org/$1.git" "$AUR_PACKAGE_DIR"

    if ! ls "$AUR_PKGBUILD" >/dev/null; then
        echo "PKGBUILD not found. Exiting..."
        return 1
    fi

    # cd into the package directory
    cd "$AUR_PACKAGE_DIR" || return 1

    # install the package with the PKGBUILD
    makepkg -irs --noconfirm --needed

    # assuming successful install, switch back to the previous directory
    cd "$CURRENT_DIR" || return 1

    # remove build directory
    rm -rf "$AUR_BUILD_DIR"

    # return a successful install
    return 0
}

# function to install the required dependencies
install_deps () {
    echo "Installing dependencies (base-devel, git & jq)..."

    # run the pacman command to install the packages
    sudo pacman -Sq --noconfirm --needed base-devel git jq || return 1

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

