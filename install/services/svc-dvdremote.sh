echo -e "\nConfiguring IR Remote service... "
# Copy python commands for input device >> vlc mapping
cp ~/.local/share/berry-player/home/pi/vlc_media_buttons.py /home/$USER

#sudo cp ~/.local/share/berry-player/etc/systemd/system/dvd-remote.service /etc/systemd/system/

# Generating service file using variables!
# Define file template
SERVICE_FILE_CONTENT="[Service]
Type=simple
User=$USER
ExecStart=python3 /home/$USER/vlc_media_buttons.py --password $VLC_PASS /dev/input/by-id/usb-flirc.tv_flirc-if01-event-kbd

[Install]
WantedBy=multi-user.target
"

# Define path
SERVICE_FILE_PATH="/etc/systemd/system/dvd-remote.service"

# Generate file
echo "$SERVICE_FILE_CONTENT" | sudo tee "$SERVICE_FILE_PATH" > /dev/null