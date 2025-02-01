sudo cp ~/.local/share/berry-player/etc/systemd/system/dvd-background.service /etc/systemd/system/

# Check for /usr/share/backgrounds/ directory
if [ ! -d /usr/share/backgrounds/ ]; then
    # Create the directory if not
    sudo mkdir -p /usr/share/backgrounds/
fi

# Copy theme files to proper location
sudo cp ~/.local/share/berry-player/themes/$SELECTED_THEME/dvd.* /usr/share/backgrounds/

# Configure cmdline.txt using berry-player defaults
[ -f "/boot/firmware/cmdline.txt" ] && sudo mv /boot/firmware/cmdline.txt /boot/firmware/cmdline.txt.bak
sudo cp ~/.local/share/berry-player/config/firmware/cmdline.txt /boot/firmware/

sudo systemctl enable dvd-background