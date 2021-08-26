#!/usr/bin/env bash

# enable natural scrolling if on laptop
local touchpad_id="$(xinput list | egrep "slave.*pointer" | grep -v XTEST | grep -i "touchpad" | sed -e 's/^.*id=//' -e 's/\s.*$//'"
xinput --set-prop "$touchpad_id"  "libinput Natural Scrolling Enabled" 1
