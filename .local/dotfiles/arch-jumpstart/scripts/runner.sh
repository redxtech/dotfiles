#!/usr/bin/env sh

main () {
    # set base path
    JS_BASE="$(dirname "$(dirname -- "$(realpath "$0")")")"
    export JS_BASE
    
    # shellcheck source=./00-install-pacaur.sh
    . "$JS_BASE/00-install-pacaur.sh"
    
    # shellcheck source=./10-add-herecura-repo.sh
    . "$JS_BASE/10-add-herecura-repo.sh"

    # shellcheck source=./20-install-packages.sh
    . "$JS_BASE/20-install-packages.sh"

    # shellcheck source=./30-go-over-configuration.sh
    . "$JS_BASE/30-go-over-configuration.sh"

    # shellcheck source=./40-start-services.sh
    . "$JS_BASE/40-start-services.sh"
}

main

