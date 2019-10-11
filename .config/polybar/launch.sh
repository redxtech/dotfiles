#!/usr/bin/env bash

# terminate already running polybar instances
killall -q polybar

# wait unti; the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main >>/tmp/polybar1.log 2>&1 &
polybar other >>/tmp/polybar2.log 2>&1 &

echo "Bars launched..."
