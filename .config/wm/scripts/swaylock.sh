#!/usr/bin/env sh

if test "$1" = "screen"; then
	LOCK_STYLE="--screenshots"
else
	LOCK_STYLE="--image ~/Pictures/Wallpaper/new_beginning_4k.png"
fi

swaylock \
	--daemonize \
	--grace 5 \
	--ignore-empty-password \
	--clock \
	--text-color ffffff \
	--inside-clear-color 8be9fd \
	--ring-clear-color bd93f9 \
	--indicator \
	--indicator-x-position 200 \
	--indicator-y-position 1240 \
	--effect-blur 5x10 \
	$LOCK_STYLE

if test "$1" = "sleep"; then
	sleep 0.25 && hyprctl dispatch dpms off
fi
