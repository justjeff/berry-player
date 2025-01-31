sudo cp ~/.local/share/berry-player/etc/systemd/system/ /etc/systemd/system/

sudo systemctl enable dvd-background

# Check for /usr/share/backgrounds/ directory
if [ ! -d /usr/share/backgrounds/ ]; then
    # Create the directory if not
    sudo mkdir -p /usr/share/backgrounds/
fi

sudo cp ~/.local/share/berry-player/themes/$SELECTED_THEME/dvd.* /usr/share/backgrounds/