#!/usr/bin/env sh

main () {
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
    # - use coloured output
    # - show table of packages with size before install
    sudo sed -i \
        -e 's/^#Color$/Color/' \
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
}

main

