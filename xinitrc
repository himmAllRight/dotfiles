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

# Minimal
exec openbox & nitrogen --restore & tint2 & docky & dmenu & compton & urxvt
#exec pekwm & urxvt & compton & synapse
#exec twm

# Tiny and small wm
#~/Builds/tinywm-1.3/tinywm & urxvt & urxvt
#~/Builds/SmallWm/bin/smallwm & urxvt & urxvt


#Tiling
#exec dwm 
#exec i3 & compton
#exec awesome 

# Stand Alone display
#exec metacity & urxvt & nitrogen --restore & synapse
#exec compiz cc & urxvt
#exec gala & plank & wingpanel & slingshot-launcher & urxvt


