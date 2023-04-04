#!/usr/bin/env bash

# check if a program is running, and if not, run it
run() {
	if ! pgrep -f "$1"; then
		# shellcheck disable=SC2068
		$@ &
	fi
}

APP_DIRS=(
	"$HOME/.local/share/applications"
	"/usr/share/applications"
)

# run from local desktop file
drun() {
	if ! pgrep -f "$1"; then
		for dir in "${APP_DIRS[@]}"; do
			if test -f "$dir/$1.desktop"; then
				dex "$dir/$1.desktop"
				return
			fi
		done
	fi
}

# run shell script
srun() {
	# shellcheck disable=SC2068
	$@ &
}

# connectivity applets
# run nm-applet --indicator
# run blueman-applet

# app background daemons
run thunar --daemon

# user apps
drun bitwarden
drun discord
drun spotify
# drun megasync
# run hexchat
# run qbittorrent
# run virt-manager
