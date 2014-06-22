#!/bin/sh
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

#exec dbus-launch --exit-with-session openbox-session &
#exec dbus-launch --exit-with-session i3 &
#exec startxfce4

#exec awesome 
#exec openbox 

#xbindkeys 
~/Builds/tinywm-1.3/tinywm & urxvt & urxvt
#exec twm

#exec dwm 
#exec i3 

#exec metacity & 
#exec gnome-terminal

