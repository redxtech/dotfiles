#!/usr/bin/env sh

# configure dns
main () {
    # check that it isn't already in NetworkManager config
    if grep "rc-manager=resolvconf" /etc/NetworkManager/NetworkManager.conf; then
        echo "NetworkManager config already added!"
    else
        # shellcheck disable=SC2024
        sudo tee -a /etc/NetworkManager/NetworkManager.conf < "$JS_BASE/files/NetworkManager.conf" >/dev/null
    fi

    # check that the dns isn't already installed
    if grep "1.1.1.1" /etc/resolvconf.conf; then
        echo "1.1.1.1 DNS already added!"
    else
        # shellcheck disable=SC2024
        echo "name_servers=\"1.1.1.1 1.0.0.1\"" | sudo tee -a /etc/resolvconf.conf >/dev/null

        # run resolvconf to update the dns servers
        sudo resolvconf -u
    fi
}

main

