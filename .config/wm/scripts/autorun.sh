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
srun ~/.config/wm/scripts/sreenlayout.sh

# start notification agent
run dunst

# start polkit
srun /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# restore wallpaper
srun ~/.fehbg

# run autostart desktop files
dex -a -s /etc/xdg/autostart/:~/.config/autostart/

# compositor
run picom -b

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
 
