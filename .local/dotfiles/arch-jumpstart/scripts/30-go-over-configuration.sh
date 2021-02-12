#!/usr/bin/env sh

main () {
    # check media-sync configuration
    vim "$HOME/.local/dotfiles/config/media-sync.sh"

    # TODO: add system config files here as well


    # create media-sync folders
    # shellcheck source=/home/redxtech/.local/dotfiles/config/media-sync.sh
    . "$HOME/.local/dotfiles/config/media-sync.sh"

    mkdir -pv "$_MS_SONARR_DEST"
    mkdir -pv "$_MS_RADARR_DEST"
}

main

