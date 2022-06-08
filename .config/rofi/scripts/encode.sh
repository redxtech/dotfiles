#!/usr/bin/env sh
#
# script name: encode
# description: choose from some preset options to encode a video file
# usage: encode.sh <input>

main () {
	input="$1"

	# see if a preset can be selected
	preset="$(printf 'Custom\nDiscord\nHigh\nMedium\nLow' | rofi -dmenu -i -p 'Preset:')"

	# fill options based on selected preset
	case $preset in
		Discord) # embed in discord: decent quality vp9 & opus in a webm
			vid_codec="vpx-vp9"
			quality="-crf 25 -b:v 0"
			vid_preset=""
			audio_codec="libopus"
			audio_bitrate="256k"
			container="webm"

			output="$(basename "$input" | sed 's/\..*$//') [discord].$container"
			;;
		High) # high quality x264 & opus in an mkv
			vid_codec="x264"
			quality="-crf 22"
			vid_preset="-preset medium"
			audio_codec="libopus"
			audio_bitrate="320k"
			container="mkv"

			output="$(basename "$input" | sed 's/\..*$//') [$vid_codec-$quality-$audio_codec-$audio_bitrate].$container"
			;;
		Medium) # decent quality x265 & opus in an mkv
			vid_codec="x265"
			quality="-crf 26"
			vid_preset="-preset veryfast"
			audio_codec="libopus"
			audio_bitrate="256k"
			container="mkv"

			output="$(basename "$input" | sed 's/\..*$//') [$vid_codec-$quality-$audio_codec-$audio_bitrate].$container"
			;;
		Low) # conservative quality x265 & opus in an mkv
			vid_codec="x265"
			quality="-crf 32"
			vid_preset="-preset veryfast"
			audio_codec="libopus"
			audio_bitrate="128k"
			container="mkv"

			output="$(basename "$input" | sed 's/\..*$//') [$vid_codec-$quality-$audio_codec-$audio_bitrate].$container"
			;;
		*) # choose your own options with rofi

			# all other options rely on the video codec
			vid_codec="$(printf 'x264\nx265\nvpx-vp9' | rofi -dmenu -p 'Video Codec:')"
			quality="-crf $(printf '18\n22\n26\n30' | rofi -dmenu -p 'Video Quality:')"
			audio_bitrate="$(printf '128k\n256k\n320k' | rofi -dmenu -p 'Audio Birate:')"

			# if not vp9, choose a preset, audio codec, and container.
			# otherwise default to opus & webm
			if ! test "$vid_codec" = "vpx-vp9"; then
				vid_preset="-preset $(printf 'ultrafast\nveryfast\nmedium\nveryslow' | rofi -dmenu -p 'Preset:')"
				audio_codec="$(printf 'libopus\naac\ncopy' | rofi -dmenu -p 'Audio Codec:')"
				container="$(printf 'webm\nmkv' | rofi -dmenu -p 'Container:')"
			else
				vid_preset=""
				audio_codec="libopus"
				container="webm"
			fi


			output="$(basename "$input" | sed 's/\..*$//') [$vid_codec-$quality-$audio_codec-$audio_bitrate].$container"
			;;
	esac

	# encode the file with ffmpeg
	ffmpeg -i "$input" -c:v "lib$vid_codec" $quality $vid_preset -c:a "$audio_codec" -b:a "$audio_bitrate" "$output"

	# get status of encode command
	encode_status="$?"

	# if the encode was successful, send a notification
	if test "$encode_status" = "0"; then
		should_view="$(dunstify \
			--appname=FFmpeg \
			--action=yes,"View result" \
			--timeout=0 \
			--icon=videoclip-amarok \
			"Video encode completed" \
			"$output has finished encoding.")"

		# if the user clicks the notification (runs the action)
		# open the output file in thunar
		if test "$should_view" = "yes"; then
			thunar "$output"
		fi
	fi


}

main "$@"

