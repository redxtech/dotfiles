#!/usr/bin/env sh

main () {
    # make folders
    mkdir -pv "$HOME/media/mnt/movies"
    mkdir -pv "$HOME/media/mnt/tv"
    mkdir -pv "$HOME/.config/systemd/user"

    # copy service files to proper location
    sudo cp -i "$JS_BASE/services/mount-movies.service" /etc/systemd/system/
    sudo cp -i "$JS_BASE/services/mount-tv.service" /etc/systemd/system/

    cp -i "$JS_BASE/services/media-sync.service" ~/.config/systemd/user
    cp -i "$JS_BASE/services/media-sync.timer" ~/.config/systemd/user
    cp -i "$JS_BASE/services/geoclue-agent.service" ~/.config/systemd/user

    # reload daemon
    sudo systemctl daemon-reload
    systemctl --user daemon-reload

    # enable ssh server
    sudo systemctl enable --now sshd.service

    # enable custom services
    sudo systemctl enable mount-movies.service
    sudo systemctl enable mount-tv.service
    
    systemctl --user enable media-sync.timer
    systemctl --user enable --now geoclue-agent.service
}

main

