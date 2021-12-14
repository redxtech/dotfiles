#!/usr/bin/env sh

main () {
    # passwordless sudo
    # sudo EDITOR="$(nvim)" visudo
    
    # remove files that prevent pwless sudo
    # local rm_dropins=(
    #   "/etc/sudoers.d/10-installer"
    #   "/etc/sudoers.d/pwfeedback"
    # )
    # for dropin in $rm_dropins; do
    #   if test -f "$dropin"; then
    #     sudo rm -f "$dropin"
    #   fi
    # done

    # make changes to makepkg.conf:
    # - use all cores for compilation
    # - use ccache for faster subsequent compilations
    # - use tmpfs for compilation
    # - skip compression step
    echo "Editing makepkg.conf..."
    sudo sed -i \
        -e 's/^#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$(nproc)\"/' \
        -e 's/^BUILDENV=(.*)/BUILDENV=(!distcc color ccache check !sign)/' \
        -e 's/^#BUILDDIR=\/tmp\/makepkg/BUILDDIR=\/tmp\/makepkg/' \
        -e "s/^PKGEXT='.pkg.tar.zst'/PKGEXT='.pkg.tar'/" \
        /etc/makepkg.conf

    # pacman configuration
    # - use coloured output
    # - show table of packages with size before install
    echo "Editing pacman.conf"
    sudo sed -i \
        -e 's/^#Color$/Color/' \
        -e 's/^#VerbosePkgLists/VerbosePkgLists/' \
        /etc/pacman.conf

    # add secret if not already there
    if grep -q -E '^ILoveCandy' /etc/pacman.conf; then
        echo "ILoveCandy already configured"
    else
        echo "Configure ILoveCandy secret"
        sudo sed -i -e '/# Misc options/a ILoveCandy' /etc/pacman.conf
    fi

    # enable ssh
    echo "Configuring & enabling sshd"
    sudo sed -i \
      -e 's/^#Port.*/Port 22/' \
      /etc/ssh/sshd_config

    sudo systemctl enable --now sshd.service

}

main

