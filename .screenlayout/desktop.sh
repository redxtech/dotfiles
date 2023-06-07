#!/bin/sh

main() {
	# set the display configuration
	xrandr \
		--output DisplayPort-0 --mode 2560x1440 --rate 144 --pos 0x0 --rotate normal --primary \
		--output DisplayPort-1 --mode 2560x1440 --rate 144 --pos 2560x0 --rotate normal

	# adjust wallpaper
	~/.fehbg
}

main "$@"
