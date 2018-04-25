#!/bin/sh
scrot /tmp/screen_locked.png -c -d 1
convert /tmp/screen_locked.png -scale 2.5% -scale 4000% /tmp/screen_locked2.png
i3lock -f -i /tmp/screen_locked2.png
