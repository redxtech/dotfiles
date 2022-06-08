#!/usr/bin/env sh
# 
# script name: archive
# description: archives files or unpacks archives
# usage: archive.sh <pack|unpack> <archive|files>

# some safety precautions
set -eu

# create an archive with the files passed as arguments
create_archive () {
	# get options from user
	name="$(rofi -dmenu -theme textinput -p 'Archive Name:')"

	archive_options=".xz\n.txz\n.gz\n.tgz\n.bz\n.tbz\n.bz2\n.tbz2\n.Z\n.tZ\n.lzo\n.tzo\n.lz\n.tlz\n.7z\n.t7z\n.tar\n.zip\n.jar\n.war\n.rar\n.lha\n.lhz\n.alz\n.ace\n.a\n.arj\n.arc\n.rpm\n.deb\n.cab\n.lzma\n.rz\n.lrz\n.cpio"

	filetype="$(echo "$archive_options" | rofi -dmenu -theme dracula -p 'Archive Type:')"

	output="$name$filetype"

	apack "$output" "$@"

	# get status of archive command
	archive_status="$?"

	# time for notification to stay present
	timeout="120000" # 120 seconds

	# if the archival was successful, send a notification
	if test "$archive_status" = "0"; then
		should_view="$(dunstify \
			--appname=ATool \
			--action=yes,"View result" \
			--timeout="$timeout" \
			--icon=archive \
			"Archive creation finished" \
			"$output has been successfully archived.")"

		# if the user clicks the notification (runs the action)
		# open the output file in thunar
		if test "$should_view" = "yes"; then
			thunar "$output"
		fi
	else
		# send a failure notification if it doesn't work
		dunstify \
			--appname=ATool \
			--timeout="$timeout" \
			--icon=archive \
			"Archive creation failed" \
			"Archiving $output has failed."
	fi
}

# unpack an archive
unpack_archive () {
	# unpack the archive
	aunpack "$@"

	# get status of unpack command
	unpack_status="$?"

	# time for notification to stay present
	timeout="60000" # 60 seconds

	# if the unarchival was successful, send a notification
	if test "$unpack_status" = "0"; then
		should_view="$(dunstify \
			--appname=ATool \
			--action=yes,"View result" \
			--timeout="$timeout" \
			--icon=cm_extractfiles \
			"Archive unpacking finished" \
			"The selected files have been successfully unpacked.")"

		# if the user clicks the notification (runs the action)
		# open the first selected file in thunar
		if test "$should_view" = "yes"; then
			thunar "$1"
		fi
	else
		# send a failure notification if it doesn't work
		dunstify \
			--appname=ATool \
			--timeout="$timeout" \
			--icon=cm_extractfiles \
			"Archive unpacking failed" \
			"Unpacking the selected archives has failed."
	fi
}

main () {
	# choose the proper action to take
	case "$1" in
		pack) # create an archive file
			echo "creating archive..."

			# shift $1 out of $@
			shift 1

			# create the archive
			create_archive "$@"
			;;
		unpack) # unpack an archive file
			echo "unpacking archive"

			# shift $1 out of $@
			shift 1

			# unpack the archive
			unpack_archive "$@"
			;;
		*)
			echo "unknown option"
			return 1
			;;
	esac
}

main "$@"

