#!/bin/bash

preparedesktopfile()
{
mv -fv $1 $2
chmod +x $2
}

dir=$HOME/.config/autostart/

mkdir -p $dir
cd $dir

cat > temp.txt << EOF
[Desktop Entry]
Type=Application
Exec=xautolock -time 1 -secure -nocloseout -nocloseerr -locker "/opt/locker.sh"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
X-MATE-Autostart-enabled=true
X-GNOME-Autostart-Delay=5
X-MATE-Autostart-Delay=5
Name=Force screenlock
Comment=
EOF

preparedesktopfile temp.txt xautolock.desktop


