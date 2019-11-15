#! /usr/bin/env fish

# function to install package from the using pacaur
function pacaur_install

    # check if the function has one arg
    if test -z "$argv"
        echo "error: specify a package to install"
        return 1
    end

    # install using pacaur
    pacaur -S $argv --noconfirm

    # return the status
    return $status
end

