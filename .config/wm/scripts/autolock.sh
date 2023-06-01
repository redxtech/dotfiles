#!/usr/bin/env bash

main() {
	export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"
	export SECONDARY_DISPLAY="$(xrandr | grep -v 'primary' | awk '/ connected/{print $1}')"
	# lock the screen after 10 mins
	if ! pgrep -f "xidlehook"; then
		xidlehook \
			--not-when-fullscreen \
			--not-when-audio \
			--timer 600 'betterlockscreen -l dimblur' ''
		# --timer 900 'xset dpms force off' ''
	fi
}

main
