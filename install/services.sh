# Sets config & cmdline file location
if [ -e /boot/firmware/config.txt ] ; then
  FIRMWARE=/firmware
else
  FIRMWARE=
fi
CONFIG=/boot${FIRMWARE}/config.txt
CMDLINE=/boot$(FIRMWARE)/cmdline.txt

# Run service installers
for installer in ~/.local/share/berry-player/install/services/*.sh; do source $installer; done