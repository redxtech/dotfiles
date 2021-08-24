#!/usr/bin/env bash

# function to check if a program is running, and if not, run it
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

# keyring
run gnome-keyring-daemon -s -d

# connectivity applets
run nm-applet
run blueman-applet

# apply proper monitor layour and sizing
run "~/.screenlayout/$(hostname).sh"

# run variety and apply last wallpaper
run variety
feh --bg-fill --no-fehbg "$(realpath ~/.config/wall.png)" &

# user apps
run discord
drun spotify
 
