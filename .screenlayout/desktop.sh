#!/bin/sh

main () {
	# default args for extra monitors
	second_monitor_rotation="normal"
	third_monitor="--off"

	# rotate second monitor if specified
	if test "$1" = "rotate" || test "$1" = "rotate+third"; then
		second_monitor_rotation="right"
	fi

	# enable third monitor if specified
	if test "$1" = "third"; then
		third_monitor="--mode 3840x2160 --pos 5120x0 --rotate normal"
	elif test "$1" = "rotate+third"; then
		third_monitor="--mode 3840x2160 --pos 4000x0 --rotate normal"
	fi

	# set the display configuration
	xrandr \
		--output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --primary \
		--output DisplayPort-1 --mode 2560x1440 --pos 2560x0 --rotate "$second_monitor_rotation" \
		--output DisplayPort-2 --off \
		--output HDMI-A-0 $third_monitor
}

main "$@"
