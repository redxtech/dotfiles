#!/usr/bin/env bash


# apply proper monitor layour and sizing
if test "$(hostname)" = "desktop"; then
  xrandr --output DVI-I-0 --off \
    --output DVI-I-1 --off \
    --output HDMI-0 --mode 3840x2160 --pos 2560x0 --rotate normal \
    --output DP-0 --primary --mode 2560x1440 --pos 0x360 --rotate normal \
    --output DP-1 --off \
    --output DVI-D-0 --off
elif test "$(hostname)" = "laptop"; then
  xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP-1 --off \
    --output DP-2 --off \
    --output DP-3 --off
fi

