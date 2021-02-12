#!/usr/bin/env sh

main () {
    # copy service files to proper location
    sudo cp -i "$JS_BASE/services/*" /etc/systemd/system/

    # reload daemon
    sudo systemctl daemon-reload

    # enable services
    sudo systemctl enable media-sync.timer
    sudo systemctl enable mount-movies.service
    sudo systemctl enable mount-tv.service
}

main

