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
srun ~/.config/wm/scripts/screenlayout.sh

# bar
srun ~/.config/polybar/launch.sh

# notification agent
run dunst

# start polkit
srun /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# restore allpaper
srun ~/.fehbg

# autostart desktop files
dex -a -s /etc/xdg/autostart/:~/.config/autostart/

# compositor
run picom -b

# connectivity applets
run nm-applet --indicator
run blueman-applet

# user apps
run discord
run variety
run flameshot

# host specific apps
if test "$(hostname)" = "desktop"; then
  run qbittorrent
  run megasync
  run headset-charge-indicator
fi

# apps from local desktop files
drun spotify
 
# cursor
xsetroot -cursor_name left_ptr &

# power manager
run xfce4-power-manager

# low battery notifier
# srun ~/.config/bspwm/scripts/low_bat_notifier.sh

# autolock screen
srun ~/.config/awesome/scripts/autolock.sh

# run natural scrolling script if on laptop
if test "$(hostname)" = "laptop"; then
  srun ~/.config/awesome/scripts/natural-scrolling.sh
fi

