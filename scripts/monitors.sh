#!/bin/bash

#xrandr --auto --output LVDS-0 --rotate normal --mode 1920x1080 
#xrandr --auto --output DP-2 --rotate right --mode 1920x1080 --left-of HDMI-0 --output HDMI-0 --rotate left --mode 1920x1080
#xrandr --auto --output DVI-I-3 --rotate normal --mode 1920x1080 --left-of DVI-I-2 --output DVI-I-2 --rotate right --mode 1920x1080


#nitrogen --restore

# Home Dock Monitors?
xrandr --auto --output DP-2-1 --mode 1920x1080 --right-of DP-2-2 --output DP-2-2 --mode 1920x1080 --dpi 90
