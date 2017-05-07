#!/bin/sh
scrot /tmp/screen_locked.png -c -d 1
convert /tmp/screen_locked.png -scale 5% -scale 2000% /tmp/screen_locked2.png
i3lock -f -i /tmp/screen_locked2.png
