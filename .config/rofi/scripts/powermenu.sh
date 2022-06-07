#!/usr/bin/env sh
#
# script name: powermenu
# description: choose from power options and enact the choice

# available options for powermenu
lock="    Lock"
logout="    Logout"
shutdown="    Shutdown"
reboot="    Reboot"
sleep="    Sleep"

# get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu -i -p "Power" -config ~/.config/rofi/scripts/powermenu.rasi)

# do something based on selected option
case "$selected_option" in
	"$lock")
    betterlockscreen -l dimblur
		;;
	"$logout")
    bspc quit
		;;
	"$shutdown")
    systemctl poweroff
		;;
	"$reboot")
    systemctl reboot
		;;
	"$sleep")
    amixer set Master mute
    systemctl suspend
		;;
	*)
		echo "No match"
		;;
esac

