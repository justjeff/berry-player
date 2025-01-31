#sudo cp ~/.local/share/berry-player/etc/systemd/system/dvd-play.service /etc/systemd/system/

# Generating service file using variables!
# Define file template
SERVICE_FILE_CONTENT="[Unit]
Description=Play DVD
Wants=turn-on-screen.service

[Service]
User=$USER
ExecStart=vlc --intf http --http-password=$VLC_PASS --play-and-exit --no-video-title-show dvdsimple://"

# Define path
SERVICE_FILE_PATH="/etc/systemd/system/dvd-play.service"

# Generate file
echo "$SERVICE_FILE_CONTENT" | sudo tee "$SERVICE_FILE_PATH" > /dev/null

# Set up DVD rules to start/stop service when disk is inserted
sudo cp ~/.local/share/berry-player/etc/udev/rules.d/90-dvd.rules /etc/udev/rules.d/

# Configure config.txt using berry-player defaults
[ -f "/boot/firmware/config.txt" ] && sudo mv /boot/firmware/config.txt /boot/firmware/config.txt.bak
sudo cp ~/.local/share/berry-player/config/firmware/config.txt /boot/firmware/
