#!/usr/bin/env bash

# lock the screen after 10 mins
main () {
  if ! pgrep -f "xautolock"; then
    xautolock \
      -corners --++ \
      -locker "betterlockscreen -l dimblur"
  fi
}

main

