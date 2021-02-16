#!/usr/bin/env sh

main () {
    # set base path
    JS_BASE="$(dirname "$(dirname -- "$(realpath "$0")")")"
    export JS_BASE
    
    # loop through and run all scripts
    # shellcheck disable=SC2231
    for file in $JS_BASE/scripts/*.sh; do
        if [ "$(basename "$file")" = "runner.sh" ]; then
            # avoid running this file
            true
        else
            sh "$file"
        fi
   done
}

main

