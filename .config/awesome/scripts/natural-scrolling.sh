#!/usr/bin/env bash

# enable natural scrolling if on laptop
main () {
  local touchpad_id="$(xinput list | egrep "slave.*pointer" | grep -v XTEST | grep "Touchpad" | sed -e 's/^.*id=//' -e 's/\s.*$//')"
  xinput --set-prop "$touchpad_id"  "libinput Natural Scrolling Enabled" 1
}

main

