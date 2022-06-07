#!/usr/bin/env sh

main () {
	selected="$(pactl list short sinks | \
		awk '{ print $2 }' | \
		sed -E 's/alsa_output\.(.*)\..*/\1/g; s/.*Arctis_7.*/SteelSeries Arctis 7/; s/pci-0000_2e_00.*/AV Receiver/' | \
		rofi -dmenu -p "Output:" | \
		sed -E 's/.*Arctis.*/alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00.stereo-game/; s/AV Receiver/alsa_output.pci-0000_2e_00.4.iec958-stereo/'
	)"

	pactl set-default-sink "$selected"
}

main "$@"

