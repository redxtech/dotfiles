#!/usr/bin/env sh

main () {
    # check media-sync configuration
    nvim "$HOME/.local/dotfiles/config/media-sync.sh"

    # passwordless sudo
    sudo EDITOR="$(which nvim)" visudo

    # make changes to makepkg.conf:
    # - use all cores for compilation
    # - use ccache for faster subsequent compilations
    # - use tmpfs for compilation
    # - skip compression step
    sudo sed -i \
        -e 's/^#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/' \
        -e 's/^BUILDENV=(.*)/BUILDENV=(!distcc color ccache check !sign)/' \
        -e 's/^#BUILDDIR=\/tmp\/makepkg/BUILDDIR=\/tmp\/makepkg/' \
        -e "s/^PKGEXT='.pkg.tar.zst'/PKGEXT='.pkg.tar'/" \
        /etc/makepkg.conf

    # pacman configuration
    sudo sed -i \
        -e 's/^#Color$/Color/' \
        -e 's/^#TotalDownload/TotalDownload/' \
        -e 's/^#VerbosePkgLists/VerbosePkgLists/' \
        /etc/pacman.conf

    # add secret if not already there
    if grep -q -E '^ILoveCandy' /etc/pacman.conf; then
        echo "Secret already configured"
    else
        sudo sed -i -e '/# Misc options/a ILoveCandy' /etc/pacman.conf
    fi

    # remove mirrors (random, brazil) from chaotic mirrorlist
    sudo sed -i \
        -e 's/^Server = https:\/\/random/# Server = https:\/\/random/' \
        -e 's/^Server = https:\/\/br-sp/# Server = https:\/\/br-sp/' \
        /etc/pacman.d/chaotic-mirrorlist

    # change geoclue api key
    sudo sed -i \
        -e 's/^#url=https:\/\/location.services.mozilla.com\/v1\/geolocate?key=YOUR_KEY/url=https:\/\/location.services.mozilla.com\/v1\/geolocate?key=geoclue/' \
        /etc/geoclue/geoclue.conf

    # create media-sync folders
    # shellcheck source=/home/gabe/.local/dotfiles/config/media-sync.sh
    . "$HOME/.local/dotfiles/config/media-sync.sh"
    mkdir -pv "$_MS_SONARR_DEST"
    mkdir -pv "$_MS_RADARR_DEST"

    # create sudo group and add me to it
    if grep -q -E "^sudo:" /etc/group; then
        echo "sudo group already created"
    else
        sudo groupadd sudo
    fi
    if groups "$USER" | grep -q '\bsudo\b'; then
        echo "user already in group"
    else
        sudo usermod -a -G sudo "$USER"
    fi

    # add permission for redshift to use geoclue
    if grep -q redshift /etc/geoclue/geoclue.conf; then
        echo "already added redshift permission"
    else
        sudo tee -a /etc/geoclue/geoclue.conf < "$JS_BASE/files/geoclue.conf" >/dev/null
    fi
}

main

