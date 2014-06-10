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

<<<<<<< HEAD
#exec awesome 
exec i3 
#exec openbox
=======
#exec awesome &
#exec icewm &
>>>>>>> 50bc7de8227c8086ca826c136ecee345d6a2bb49

#xbindkeys 
#tinywm 

<<<<<<< HEAD
#exec dwm 

#nitrogen --restore &
xcompmgr &

=======
#exec dwm &
exec i3 

>>>>>>> 50bc7de8227c8086ca826c136ecee345d6a2bb49
