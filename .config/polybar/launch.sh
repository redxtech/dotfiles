#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar top -c ~/.config/polybar/config.ini &

# if a second monitor exists, run a second polbar on the next monitor
m=$(bspc query -M -m 'primary#next' --names) && { SECOND_MONITOR=$m polybar top_second -c ~/.config/polybar/config.ini & }

