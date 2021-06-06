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

    # change geoclue api key
    sudo sed -i \
        -e 's/^#url=https:\/\/location.services.mozilla.com\/v1\/geolocate?key=YOUR_KEY/url=https:\/\/location.services.mozilla.com\/v1\/geolocate?key=geoclue/' \
        /etc/geoclue/geoclue.conf

    # add permission for redshift to use geoclue
    if grep -q redshift /etc/geoclue/geoclue.conf; then
        echo "already added redshift permission"
    else
        # shellcheck disable=2024
        sudo tee -a /etc/geoclue/geoclue.conf < "$JS_BASE/files/geoclue.conf" >/dev/null
    fi
}

main

