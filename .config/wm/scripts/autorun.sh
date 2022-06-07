#!/usr/bin/env sh

# check if a program is running, and if not, run it
run () {
  if ! pgrep -f "$1"; then
    # shellcheck disable=SC2068
    $@&
  fi
}

# run from local desktop file
drun () {
  if ! pgrep -f "$1"; then
    dex ~/.local/share/applications/"$1".desktop
  fi
}

# run shell script
srun () {
  # shellcheck disable=SC2068
  $@&
}

# apply env variables
export QT_QPA_PLATFORMTHEME=qt5ct

# apply proper monitor layour and sizing
srun ~/.screenlayout/desktop.sh

# bar
srun ~/.config/polybar/launch.sh

# notification agent
run dunst

# start polkit
srun /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# restore allpaper
srun ~/.fehbg

# autostart desktop files
# dex -a -s /etc/xdg/autostart/:~/.config/autostart/

# compositor
run picom -b

# connectivity applets
run nm-applet --indicator
run blueman-applet

# user apps
run discord
run flameshot
run spotify
run thunar --daemon

# variety won't work with the run command
variety &

# move spotify to proper workspace
sleep 6 && wmctrl -r spotify -t 7

# host specific apps
if test "$(hostname)" = "desktop"; then
  run megasync
	run element-desktop
  run hexchat
	# run qbittorrent
fi

# cursor
xsetroot -cursor_name left_ptr &

# power manager
run xfce4-power-manager

# autolock screen
srun ~/.config/wm/scripts/autolock.sh

# autolock disabler
# srun ~/.config/wm/scripts/beans

# run natural scrolling script if on laptop
if test "$(hostname)" = "laptop"; then
  srun ~/.config/wm/scripts/natural-scrolling.sh
fi

