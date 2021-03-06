#!/bin/sh

# script to handle currenly playing music (or whatever is playing)

main () {
    # initialize some variables
    players="spotify vlc plasma-browser-integration"
    player=""

    # set icons
    play_icon=""
    pause_icon=""

    # test that playerctl is installed
    if ! command -v playerctl >/dev/null; then
        echo "error: playerctl isn't installed"
        return 1
    fi

    # test if a player is playing something (with priority given to first specified)
    for local_player in $players; do
        if [ "$(playerctl -p "$local_player" status 2>/dev/null)" = "Playing" ]; then
            player="$local_player"
            break
        fi
    done
    
    # if nothing is playing, try all players
    if [ "$player" = "" ]; then
        player="$(echo "$players" | sed -E 's/ /,/g')"
    fi

    # set the command to use the right player
    cmd="playerctl -p $player"

    # set the format string based on player
    format_string=""
    case "$player" in
        vlc) # for vlc just use the title
            format_string="{{title}}"
            ;;
        *)
            format_string="{{artist}} - {{title}}"
            ;;
    esac

    # run the proper command based on input
    case "$1" in
        # show default formatting
        default)
            $cmd metadata --format "$format_string" 2>/dev/null
            ;;
        # show default formatting with status icons
        icons)
            icon=""
            if [ "$($cmd status 2>/dev/null)" = "Playing" ]; then
                icon="$play_icon"
            else
                icon="$pause_icon"
            fi
            $cmd metadata --format "$icon  $format_string" 2>/dev/null
            ;;
        reverse)
            icon=""
            if [ "$($cmd status 2>/dev/null)" = "Playing" ]; then
                icon="$pause_icon"
            else
                icon="$play_icon"
            fi
            $cmd metadata --format "$icon  $format_string" 2>/dev/null
            ;;
        # passthrough commands to playerctl
        *)
        params=$*

        if [ "$params" = "" ]; then
            icon=""
            if [ "$($cmd status 2>/dev/null)" = "Playing" ]; then
                icon="$play_icon"
            else
                icon="$pause_icon"
            fi
            $cmd metadata --format "$icon  $format_string" 2>/dev/null
        else
            $cmd "$@" 2>/dev/null
        fi
        ;;
    esac
}

main "$@"

