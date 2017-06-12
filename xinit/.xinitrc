#!/bin/sh
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Main
#exec dbus-launch --exit-with-session openbox-session 
exec dbus-launch --exit-with-session i3 
#exec awesome 

#xbindkeys 
#~/Builds/tinywm-1.3/tinywm & urxvt & urxvt
#~/Builds/SmallWm/bin/smallwm & urxvt & urxvt

#exec twm

#exec dwm 
#exec i3 & compton

#exec metacity & urxvt & nitrogen --restore & synapse
#exec pekwm & urxvt & compton & synapse

#exec gala & plank & wingpanel & slingshot-launcher & urxvt


#exec dbus-launch --exit-with-session mate-session

#exec gnome-session

#exec budgie-desktop
