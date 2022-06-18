#!/usr/bin/env bash

# choose theme here
theme="dracula"

# kill polybar if it's running
killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# choose which bar
if test "$(hostname)" = "desktop"; then
	barname="main"
elif test "$(hostname)" = "laptop"; then
	barname="laptop"
fi

# start main polybar instance
polybar "$barname" -c "$HOME/.config/polybar/themes/$theme/config.ini" &
#
# if a second monitor exists, run a second polbar on the next monitor
if test "$(bspc query -M | wc -l)" -gt "1"; then
	MONITOR="DisplayPort-1" polybar secondary -c "$HOME/.config/polybar/themes/$theme/config.ini" &
fi

# alternate method of above, doesn't work as well
# m=$(bspc query -M -m 'primary#next' --names) && { MONITOR=$m polybar top_second -c "$HOME/.config/polybar/themes/$theme/config.ini" & }

