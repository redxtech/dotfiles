#!/bin/bash

function capslock() {

	caps=$(xset -q | grep Caps | awk '{ print $4 }')

	if [ $caps == 'off' ]; then
		echo "󰌎"
	else
		echo "󰘲"
	fi

}

function numlock {

	num=$(xset -q | grep Num | awk '{ print $8 }')

	if [ $num == 'off' ]; then
		echo "󰎥"
	else
		echo "󰎤"
	fi

}

function scroll() {

	scroll=$(xset -q | grep Scroll | awk '{ print $12 }')

	if [ $scroll == 'off' ]; then
		echo "󰍾"
	else
		echo "󰍽"
	fi

}

main() {

	if [ "$1" == "-c" ]; then
		capslock
	fi

	if [ "$1" == "-n" ]; then
		numlock
	fi

	if [ "$1" == "-s" ]; then
		scroll
	fi

}

main $1
