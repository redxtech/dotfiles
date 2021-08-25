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

# compositor
run picom --experimental-backend

# apply proper monitor layour and sizing
run "~/.screenlayout/$(hostname).sh"

# connectivity applets
run nm-applet
run blueman-applet

# apply previous wallpaper
feh --bg-fill --no-fehbg "$(realpath ~/.config/wall.png)" &

# user apps
run discord
run qbittorrent
run megasync
run variety
run virt-manager

# apps from local desktop files
drun spotify
 
