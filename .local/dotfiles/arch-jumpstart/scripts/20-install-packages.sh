#!/usr/bin/env sh

main () {
    # list packages into a variable
    JS_PACKAGES="$(jq '.packages.all | join(" ")' "$JS_BASE/files/packages.json" | sed -e 's/\"//g')"

    # install packages
    # shellcheck disable=SC2086
    pacaur -Sq --noconfirm $JS_PACKAGES

    echo "Packages installed!"
}

main

