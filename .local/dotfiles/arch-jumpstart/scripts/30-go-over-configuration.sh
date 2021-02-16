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

    # make changes to makepkg.conf:
    # - use all cores for compilation
    # - use ccache for faster subsequent compilations
    # - use tmpfs for compilation
    # - skip compression step
    sudo sed -i \
        -e 's/^#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/' \
        -E "s/(BUILDENV=\(.*)(\!ccache)(.*\))/\1ccache\3/g" \
        -e 's/^#BUILDDIR=\/tmp\/makepkg/BUILDDIR=\/tmp\/makepkg/' \
        -e "s/^PKGEXT='.pkg.tar.zst'/PKGEXT='.pkg.tar'/" \
        /etc/makepkg.conf

    # remove mirrors (random, brazil) from chaotic mirrorlist
    sudo sed -i \
        -e 's/^Server = https:\/\/random/# Server = https:\/\/random/' \
        -e 's/^Server = https:\/\/br-sp/# Server = https:\/\/br-sp/' \
        /etc/pacman.d/chaotic-mirrorlist

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

