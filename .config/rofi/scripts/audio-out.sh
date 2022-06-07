#!/usr/bin/env sh
# 
# script name: audio out
# description: choose from available audio sinks and switch to whichever is chosen

# get device full name given a substring
get_device () {
	pactl list short sinks | awk '{ print $2 }' | grep "$1"
}

main () {
	# get a list of sinks, and substitute the names to be more recognizable
	# then pipe it into rofi, and substitute the result back to the full sink name
	selected="$(pactl list short sinks | \
		awk '{ print $2 }' | \
		sed -E 's/.*Arctis_7.*/SteelSeries Arctis 7/; s/.*pci-0000_2e_00.*/AV Receiver/; s/.*pci-0000_24_00.*/HDMI Audio/' | \
		rofi -dmenu -i -p "Output:" |  \
		sed -E "s/.*Arctis.*/$(get_device Arctis)/; s/AV Receiver/$(get_device pci-0000_2e_00)/; s/HDMI Audio/$(get_device pci-0000_24_00)/"
	)"

	# switch to the newly chosen sink
	pactl set-default-sink "$selected"
}

main "$@"

