#!/usr/bin/env sh

alternative () {
    # set base path
    JS_BASE="$(dirname "$(dirname -- "$(realpath "$0")")")"
    export JS_BASE
    
    # loop through and run all scripts
    # shellcheck disable=SC2231
    for file in $JS_BASE/*.sh; do
        if [ "$(basename "$file")" = "runner.sh" ]; then
            # avoid running this file
            true
        else
            sh "$file"
        fi
    done
}

main () {
    # set base path
    JS_BASE="$(dirname "$(dirname -- "$(realpath "$0")")")"
    export JS_BASE
    
    # shellcheck source=./00-install-pacaur.sh
    . "$JS_BASE/scripts/00-install-pacaur.sh"
    
    # shellcheck source=./10-add-herecura-repo.sh
    . "$JS_BASE/scripts/10-add-herecura-repo.sh"

    # shellcheck source=./20-install-packages.sh
    . "$JS_BASE/scripts/20-install-packages.sh"

    # shellcheck source=./30-go-over-configuration.sh
    . "$JS_BASE/scripts/30-go-over-configuration.sh"

    # shellcheck source=./40-start-services.sh
    . "$JS_BASE/scripts/40-start-services.sh"

    # shellcheck source=./90-reminders.shj
    . "$JS_BASE/scripts/90-reminders.sh"
}

main

