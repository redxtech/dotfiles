#!/usr/bin/env sh

main () {
	extern="HDMI-A-0"

	if ! xrandr --listmonitors | grep -q "$extern"; then
		~/.screenlayout/desktop.sh third
		~/.fehbg
	else
		~/.screenlayout/desktop.sh
	fi
}

main

