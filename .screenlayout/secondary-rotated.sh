#!/bin/sh

main () {
	# default args for extra monitors
	third_monitor="--off"

	# enable third monitor if specified
	if test "$1" = "third"; then
		third_monitor="--mode 3840x2160 --pos 4000x0 --rotate normal"
	fi

	# set the display configuration
	xrandr \
		--output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --primary \
		--output DisplayPort-1 --mode 2560x1440 --pos 2560x0 --rotate right \
		--output DisplayPort-2 --off \
		--output HDMI-A-0 $third_monitor

	# adjust wallpaper
	~/.fehbg

	# set the current layout script to this script
	ln -sf "$0" "$HOME/.screenlayout/secondary-rotated.sh"
}

main "$@"

