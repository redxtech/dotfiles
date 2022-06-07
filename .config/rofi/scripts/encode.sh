#!/usr/bin/env sh
#
# script name: encode
# description: choose from some preset options to encode a video file
# usage: encode.sh <input>

main () {
	input="$1"

	# collect all options beforehand with rofi
	codec="$(printf 'vpx-vp9\nx265\nx264' | rofi -dmenu -p 'Codec:')"
	quality="$(printf '32\n30\n28\n26\n24\n22\n20\n18' | rofi -dmenu -p 'CRF:')"
	preset="$(printf 'veryfast\nmedium\nveryslow' | rofi -dmenu -p 'Preset:')"
	audio_bitrate="$(printf '128k\n256k\n320k' | rofi -dmenu -p 'Audio Birate:')"
	container="$(printf 'webm\nmkv' | rofi -dmenu -p 'Container:')"

	output="$(basename "$input" | sed 's/\..*$//') [$codec-$quality].$container"

	# encode the file with ffmpeg, and send a notification when it's done
	ffmpeg -i "$input" -c:v "lib$codec" -crf "$quality" -preset "$preset" -c:a libopus -b:a "$audio_bitrate" "$output" && \
		notify-send \
		-a ffmpeg \
		"Video encode completed" \
		"$output has finished encoding."

}

main "$@"

