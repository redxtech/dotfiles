#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar top -c ~/.config/polybar/config.ini &

if test "$(bspc query -M --names | wc -l)" = "2"; then
  SECOND_MONITOR="$(bspc query -M --names | sed 1d)" polybar top_second -c ~/.config/polybar/config.ini &
fi
