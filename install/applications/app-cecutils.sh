echo "Configruing CEC Utilities... \n"

sudo apt-get install -y cec-utils

# # If config exists, make a backup - otherwise create the config.
# if [ -f "/boot/firmware/config.txt" ]; then
#   # make backup
#   sudo cp "/boot/firmware/config.txt" "boot/firmware/config.txt.bak"
# fi
# sudo cp ~/.local/share/berry-player/configs/config.txt "/boot/firmware/config.txt"