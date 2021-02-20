#!/bin/bash

command=$(which gnome-screensaver-command || which mate-screensaver-command)

mouserestpos_x=30
mouserestpos_y=15

running=0
ps -A -o command | grep -q -E '(mate|gnome)-screensaver' && running=1

if [ "$running" != "0" ]; then
    if [ "$($command -q | grep 'inactive')" != "" ]; then
        $command -l 2>/dev/null

        if [ "$($command -q | grep 'inactive')" != "" ]; then
            xdotool key --delay 250 Shift+Control+Alt Control+Alt Escape
            $command -l 2>/dev/null
        fi
    fi

    eval $(xdotool getmouselocation --shell)
    if [ "$X" != "$mouserestpos_x" ] || [ "$Y" != "$mouserestpos_y" ] ; then
        xdotool mousemove $mouserestpos_x $mouserestpos_y
    fi
else
    zenity --warning --text="Screensaver is not running"
fi

