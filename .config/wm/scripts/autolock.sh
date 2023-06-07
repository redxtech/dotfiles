#!/usr/bin/env bash

# lock the screen after 10 mins
xidlehook \
	--not-when-fullscreen \
	--not-when-audio \
	--timer 600 'betterlockscreen -l dimblur' '' \
	--timer 900 'xset dpms force off' ''
