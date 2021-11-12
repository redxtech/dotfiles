#!/bin/sh

hidden=$(bspc query -N -n .hidden -d focused)

if [ -z "$hidden" ]; then
	bspc node focused -g hidden=on
else
	bspc node "$hidden" -g hidden=off
fi
