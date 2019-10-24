#!/usr/bin/env sh

# shellcheck source=helpers/spotify.sh
. "$HOME/.local/bin/tmux/helpers/spotify.sh"

main () {
    echo "$(spotify_msg --playbackstatus) $(spotify_msg --statusshort)" | sed 's/^ $/Spotify is off/'
}

main

