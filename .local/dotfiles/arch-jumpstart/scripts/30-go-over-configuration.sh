#!/usr/bin/env sh

main () {
    echo "Press enter to edit media-sync config..."
    read -r

    # check media-sync configuration
    nvim "$HOME/.local/dotfiles/config/media-sync.sh"

    # passwordless sudo
    echo "Press enter to configure passwordless sudo..."
    read -r

    sudo EDITOR="$(which nvim)" visudo

    # use all cores for compilation
    echo "MAKEFLAGS=\"-j$(nproc)\""
    echo "BUILDENV=(ccache)"
    echo "BUILDDIR=/tmp/makepkg"
    echo "PKGEXT=\".pkg.tar\""
    echo "Press enter to configure multi-core compilation and ccache..."
    read -r
    sudo vim /etc/makepkg.conf

    # TODO: add system config files here as well


    echo "Press enter to confirm configuration..."
    read -r

    # create media-sync folders
    # shellcheck source=/home/redxtech/.local/dotfiles/config/media-sync.sh
    . "$HOME/.local/dotfiles/config/media-sync.sh"
    mkdir -pv "$_MS_SONARR_DEST"
    mkdir -pv "$_MS_RADARR_DEST"

    # create sudo group and add me to it
    if grep -q -E "^sudo:" /etc/group; then
        sudo groupadd sudo
    fi
    if groups "$USER" | grep -q '\bsudo\b'; then
        sudo usermod -a -G sudo "$USER"
    fi
}

main

