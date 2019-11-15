#! /usr/bin/env fish

# function to install package from the AUR
function aur_install
    # some default values
    set -l build_dir "$HOME/.cache/aur_install_build"
    set -l prev_dir (pwd)

    # check if the function has one arg
    if test -z "$argv"
        echo "error: specify an AUR package"
        return 1
    else if test (count $argv) -ne 1
        echo "error: specify only one AUR package"
        return 1
    end

    # create a temporary build dir if it doesn't already exist
    if ! test -d $build_dir
        mkdir -pv $build_dir
    end

    cd $build_dir

    # clone git repo
    git clone "https://aur.archlinux.org/$argv.git"

    # make sure it wasn't empty
    set -l cloned_content $argv/*
    if test (count $cloned_content) -lt 1
        echo "error: cloned repo was empty"
        return 1
    end

    cd "$argv"

    # install the PKGBUILD
    makepkg -c -i -r -s -C --noconfirm

    cd "$prev_dir"

    # return the status
    return $status
end

