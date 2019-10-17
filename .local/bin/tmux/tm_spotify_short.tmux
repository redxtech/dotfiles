#!/usr/bin/env sh

source "$HOME/.local/bin/tmux/helpers/spotify.sh"

main () {
    echo "$(spotify_msg --playbackstatus) $(spotify_msg --statusshort)" | sed 's/^ $/Spotify is off/'
}

main

