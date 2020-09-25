#!/usr/bin/env sh

# function to run the initial configuration
main () {
    echo "Choosing pacman mirrorlist mirrors."

    # generate those

    echo "Adding herecura repo"

    # do that

    # TODO: use sed to modify config files
    # TODO: modify BUILDENV in /etc/makepkg.conf to include ccache
    # TODO: modify MAKEFLAGS in /etc/makepkg.conf to include -j9 (number of threads + 1)
    # TODO: MAKEFLAGS="-j$(nproc)"
    # TODO: PKGEXT='.pkg.tar'
    # TODO: set sh to point to dash

}

main

