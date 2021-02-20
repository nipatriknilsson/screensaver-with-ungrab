# screensaver-with-ungrab

Some software grab the keyboard or prevent the screensaver to lock your computer. Such software include Virtualbox, VMWare and media players. This can be a security risk.

This locker ignores any grabs and locks your computer on timeout. You need to keep the computer alive with pressing a key (i.e. CTRL) to make the locker not to lock during a media play.

The main ungrab line in locker.sh is
```
xdotool key --delay 250 Shift+Control+Alt Control+Alt Escape
```
xdotool sends sends the above keys, one combination after the other, to ungrab the grab, then you need to give the correct command to lock your computer. The script works with gnome-screensaver-command or mate-screensaver-command, which you need to change for your platform.

xautolock is set to 1 minute (install_locker.sh).

The only backdraw I have found is that you need to set the original locker to more time than xautolock. Otherwise you can sometimes have a black screen for a few seconds, when the lockers compete.

To install this locker, run install_locker.sh as the user you want to have this locker with. Next time you log in it is run.
```
chmod +x install_locker.sh
chmod +x locker.sh
./install_locker.sh
sudo cp -a locker.sh /opt/
```

To run directly without log out and in run:
```
xautolock -time 1 -secure -locker "/opt/locker.sh"
```

You need to install software missing, xdotool and xautolock.
