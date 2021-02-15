#!/usr/bin/env sh

main () {
    read -p "Press enter to edit media sync config..."

    # check media-sync configuration
    vim "$HOME/.local/dotfiles/config/media-sync.sh"

    # passwordless sudo
    read -p "Press enter to configure passwordless sudo..."
    sudo EDITOR="$(which nvim)" visudo

    # use all cores for compilation
    echo "MAKEFLAGS=\"-j$(nproc)\""
    echo "BUILDENV=(ccache)"
    echo "BUILDDIR=/tmp/makepkg"
    echo "PKGEXT=\".pkg.tar\""
    read -p "Press enter to configure multi-core compilation and ccache"
    sudo vim /etc/makepkg.conf

    # TODO: add system config files here as well


    read -p "Press enter to confirm configuration..."

    # create media-sync folders
    # shellcheck source=/home/redxtech/.local/dotfiles/config/media-sync.sh
    . "$HOME/.local/dotfiles/config/media-sync.sh"
    mkdir -pv "$_MS_SONARR_DEST"
    mkdir -pv "$_MS_RADARR_DEST"

    # create sudo group and add me to it
    sudo groupadd sudo
    sudo usermod -a -G sudo "$USER"
}

main

