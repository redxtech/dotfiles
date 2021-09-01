#!/usr/bin/env bash

# check if a program is running, and if not, run it
function run {
  if ! pgrep -f $1; then
    $@&
  fi
}

# run from local desktop file
function drun {
  if ! pgrep -f $1; then
    dex ~/.local/share/applications/$1.desktop
  fi
}

# run shell script
function srun {
  $@&
}

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

# sh "~/.screenlayout/desktop.sh"

# compositor
run picom --experimental-backend

# run natural scrolling script if on laptop
if test "$(hostname)" = "laptop"; then
  srun ~/.config/awesome/scripts/natural-scrolling.sh
fi

# connectivity applets
run nm-applet
run blueman-applet

# apply previous wallpaper
# commented out because i've handled this in deco/theme.lua
# feh --bg-fill --no-fehbg "$(realpath ~/.config/wall.png)" &

# autolock screen
srun ~/.config/awesome/scripts/autolock.sh

# user apps
run discord
run qbittorrent
run megasync
run variety
run virt-manager

# apps from local desktop files
drun spotify
 
