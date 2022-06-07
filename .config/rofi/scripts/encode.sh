#!/usr/bin/env sh

main () {
	input="$1"

	codec="lib$(printf 'vpx-vp9\nx265\nx264' | rofi -dmenu -p 'Codec:')"
	quality="$(printf '32\nl0\n28\n26\n24\n22\n20\n18' | rofi -dmenu -p 'CRF:')"
	preset="$(printf 'veryfast\nmedium\nveryslow' | rofi -dmenu -p 'Preset:')"
	audio_bitrate="$(printf '128k\n256k\n320k' | rofi -dmenu -p 'Audio Birate:')"
	container="$(printf 'webm\nmkv' | rofi -dmenu -p 'Container:')"

	output="$(basename "$input" | sed 's/\..*$//') [$codec].$container"


	ffmpeg -i "$input" -c:v "$codec" -crf "$quality" -preset "$preset" -c:a libopus -b:a "$audio_bitrate" "$output" && \
		notify-send \
		-a ffmpeg \
		"Video encode completed" \
		"$output has finished encoding."

}

main "$@"
