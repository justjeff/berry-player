## Remote control setup

echo Ensure your FLIRC USB dingle is installed and you have line-of-sight to your IR Remote.
echo Assign the keys on your remote to regular keys. Do not use the `play/pause`, `fastforward`, etc. commands.

flirc_util wait

echo press play/pause
flirc_util record p

echo press rewind
flirc_util record r

echo press previous track
flirc_util record b

echo press forward
flirc_util record f

echo press next track
flirc_util record n

echo press stop
flirc_util record s

echo press eject
flirc_util record e

sudo systemctl enable dvd-remote

echo Remote control service is configured. This will be active after reboot. You can reset this anytime from the berry-player command.

