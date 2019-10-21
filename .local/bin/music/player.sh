#!/bin/sh

player_cmd="playerctl -p spotify,plasma-browser-integration,vlc"

case "$@" in
    format)
        player_status=$($player_cmd status 2> /dev/null)
        if [ $player_status = "Playing" ]; then
            echo " $($player_cmd metadata --format "{{artist}} - {{title}}")"
        elif [ $player_status = "Paused" ]; then
            echo " $($player_cmd metadata --format "{{artist}} - {{title}}")"
        else
            echo "Nothing Playing"
        fi
        ;;
    *)
        $player_cmd $1
        ;;
esac
