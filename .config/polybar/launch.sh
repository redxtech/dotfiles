#!/usr/bin/env bash

# terminate already running polybar instances
killall -q polybar

# wait unti; the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [[ $HOSTNAME =~ "desktop" ]]; then
    # run the main polybar alongside the secondary polybar
    # for the second monitor
    echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
    polybar main >>/tmp/polybar1.log 2>&1 &
    polybar other >>/tmp/polybar2.log 2>&1 &
elif [[ $HOSTNAME =~ "laptop" ]]; then
    # run the laptop polybar
    echo "---" | tee -a /tmp/polybar1.log
    polybar laptop >>/tmp/polybar1.log 2>&1 &
else
    # run laptop bar, since no other single screen options
    echo "---" | tee -a /tmp/polybar1.log
    polybar laptop >>/tmp/polybar1.log 2>&1 &
fi

