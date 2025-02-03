echo -e "\nConfiguring dvd-background service... "

sudo cp ~/.local/share/berry-player/etc/systemd/system/dvd-background.service /etc/systemd/system/

# Check for /usr/share/backgrounds/ directory
if [ ! -d /usr/share/backgrounds/ ]; then
    # Create the directory if not
    sudo mkdir -p /usr/share/backgrounds/
fi

# Copy theme files to proper location
sudo cp ~/.local/share/berry-player/themes/$SELECTED_THEME/dvd.* /usr/share/backgrounds/

# Generating service file using variables!
# Define file template
SERVICE_FILE_CONTENT="[Unit]
Description=DVD Player background image

[Service]
Type=simple
ExecStart=/home/$USER/dvd-bg.sh
StandardInput=tty
StandardOutput=tty

[Install]
WantedBy=multi-user.target"
# Define path
SERVICE_FILE_PATH="/etc/systemd/system/dvd-background.service"

# Generate file
echo "$SERVICE_FILE_CONTENT" | sudo tee "$SERVICE_FILE_PATH" > /dev/null

sudo sed -i.bak -e 's/console=tty1/console=tty3/' -e '1s/^/loglevel=3 quiet logo.nologo vt.global_cursor_default=0 /' "$CMDLINE"

# Enable service
sudo systemctl enable dvd-background