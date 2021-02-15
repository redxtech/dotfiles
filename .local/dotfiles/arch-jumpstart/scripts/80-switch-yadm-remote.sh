#!/usr/bin/env sh

main () {
    # remove https remote and add ssh one
    yadm remote remove origin
    yadm remote add origin git@github.com:redxtech/dotfile.git
}

main

