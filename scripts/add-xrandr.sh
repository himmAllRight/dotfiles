#!/bin/bash

# A function to prompt the user if they want to switch to the new mode now.
switch_to_new_mode () {
    if [ "$skip_ask" == '' ]
    then
	    echo -n "Switch to mode $modename now? [y/n]: "
	    read change
    else
        change='y'
    fi
	if [ "$change" == "y" ]
	then
		echo "switching monitor..."
		xrandr --output $MONITOR --mode $modename
	else
		echo "Okay, no switch. Enjoy!"
	fi
}

# Create a new mode for the display
create_new_mode () {
	echo "Adding new mode: $gtf_output"
	xrandr --newmode $gtf_output
	echo "Adding new mode $modename to display $MONITOR"
	xrandr --addmode $MONITOR $modename
	echo "Done!"
}

# Message if the mode appears to already exist
mode_already_exists () {
	echo "Hmmm... I think the mode $modename already exists."
}

## Main Function to set vars and code
main () {
    # Parse flags and set vars
    skip_ask=''
    while getopts 'y' flag; do
        case "${flag}" in
            y) skip_ask='true' ;;
        esac
    done
    # this is a hack and ideally it should just shift the arg numbers by the
    # number of flags provided, or just make a non-flag arg list... or anything
    # better really...
    if [ "$skip_ask" == 'true' ]
    then
        # Input Vars
        WIDTH=$2
        HEIGHT=$3
        MONITOR=$4
    else
        WIDTH=$1
        HEIGHT=$2
        MONITOR=$3
    fi
	ESLEEP=3
	# Fancier Vars :P
	gtf_output=$(gtf $WIDTH $HEIGHT 59.9 | grep -i "modeline" | sed -e 's/\<Modeline\>//g')
	modename=$(echo $gtf_output | grep -o  "\(\".*\"\)")
	modeexists=$(xrandr | grep -i $modename)

	# Run
	if [ "$modeexists" == "" ]
	then
	    create_new_mode
	    switch_to_new_mode
	else
	    mode_already_exists
	    switch_to_new_mode
	fi
}

## Execute Main
main "$@"
