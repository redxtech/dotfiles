#!/usr/bin/env sh

# test for a lockfile, and create one or return an error
lockfile_init () {
    # test for the existence of a lockfile
    if test -f "$1"; then
        # if the file exists, return an error
        return 1
    else
        # if it doesn't exist, create a file and return success
        touch "$1"
        return 0
    fi
}

# handle the exit of a program
lockfile_exit () {
    # remove the lockfile
    rm "$1"

    # return success
    return 0
}

