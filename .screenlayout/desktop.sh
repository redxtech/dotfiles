#!/bin/sh

main () {
	# default args for third monitor
	third_monitor="--off"

	# enable third monitor if specified
	if test "$1" = "third"; then
		third_monitor="--mode 3840x2160 --pos 5120x0 --rotate normal"
	fi

	# set the display configuration
	xrandr \
		--output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --primary \
		--output DisplayPort-1 --mode 2560x1440 --pos 2560x0 --rotate normal \
		--output DisplayPort-2 --off \
		--output HDMI-A-0 $third_monitor
}

main "$@"
