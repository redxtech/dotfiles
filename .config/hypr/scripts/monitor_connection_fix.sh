#!/usr/bin/env bash

function handle_monitor_reconnect {
	if [[ ${1:0:12} == "monitoradded" ]]; then
		# reassign monitors
		# hyprctl keyword "monitor" "DP-1,2560x1440,0x0,1"
		# hyprctl keyword "monitor" "DP-2,2560x1440,2560x0,1"

		# loop through workspaces for each monitor and move them to where they should be
		for ws in 1 2 3 4 5 6; do
			hyprctl dispatch moveworkspacetomonitor $ws 0
		done
		for ws in 7 8 9 10; do
			hyprctl dispatch moveworkspacetomonitor $ws 1
		done
	fi
}

# listen on hyprland sock, send all results to the handle function
socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle_monitor_reconnect $line; done
