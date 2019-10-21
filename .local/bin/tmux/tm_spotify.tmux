#!/usr/bin/env sh

. "$HOME/.local/bin/tmux/helpers/spotify.sh"

main () {
    echo "$(spotify_msg --playbackstatus) $(spotify_msg --status)" | sed 's/^ $/Spotify is off/'
}

main

