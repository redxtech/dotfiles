#!/usr/bin/env sh

main () {
    # copy service files to proper location
    sudo cp -i "$JS_BASE/services/media-sync.service" /etc/systemd/system/
    sudo cp -i "$JS_BASE/services/media-sync.timer" /etc/systemd/system/
    sudo cp -i "$JS_BASE/services/mount-movies.service" /etc/systemd/system/
    sudo cp -i "$JS_BASE/services/mount-tv.service" /etc/systemd/system/

    # make folders
    mkdir -pv "$HOME/media/mnt/movies"
    mkdir -pv "$HOME/media/mnt/tv"

    # reload daemon
    sudo systemctl daemon-reload

    # enable services
    sudo systemctl enable media-sync.timer
    sudo systemctl enable mount-movies.service
    sudo systemctl enable mount-tv.service
}

main

