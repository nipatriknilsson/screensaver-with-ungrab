#!/bin/bash

set -x

mouserestpos_x=30
mouserestpos_y=15

command=$(ps -A -o command | grep -E '(mate|gnome)-screensaver' | head -1 | awk '{print $1}')

if [ "$command" != "" ]; then
    if [ "$(${command}-command -q | grep 'inactive')" != "" ]; then
        ${command}-command -l

        if [ "$(${command}-command -q | grep 'inactive')" != "" ]; then
            xdotool key --delay 100 Shift+Control+Alt Control+Alt Escape
            ${command}-command -l 2>/dev/null
        fi
    fi

    eval $(xdotool getmouselocation --shell)
    if [ "$X" -gt "$((mouserestpos_x*2))" ] || [ "$Y" -gt "$((mouserestpos_y*2))" ] ; then
        xdotool mousemove --sync $mouserestpos_x $mouserestpos_y
    fi
else
    zenity --warning --text="Screensaver is not running"
fi
