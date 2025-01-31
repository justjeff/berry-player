# Exit immediately if a command exits with a non-zero status
set -e

# Desktop software and tweaks will only be installed if we're running Gnome
#RUNNING_GNOME=$([[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]] && echo true || echo false)

# Check the distribution name and version and abort if incompatible
source ~/.local/share/berry-player/install/check-version.sh

# if $RUNNING_GNOME; then
#   # Ensure computer doesn't go to sleep or lock while installing
#   gsettings set org.gnome.desktop.screensaver lock-enabled false
#   gsettings set org.gnome.desktop.session idle-delay 0

echo "Get ready to make a few choices..."
source ~/.local/share/berry-player/install/applications/required/app-gum.sh >/dev/null
source ~/.local/share/berry-player/install/first-run-choices.sh

#   echo "Installing terminal and desktop tools..."
# else
#   echo "Only installing terminal tools..."
# fi

# Install applications
source ~/.local/share/berry-player/install/applications.sh

# Install services
source ~/.local/share/berry-player/install/services.sh

# Launch Remote Config
if [[ "$RUN_REMOTE_CONFIG" == "YES" ]]; then
    echo "Launching Remote Control setup..."
    source ~/.local/share/berry-player/utils/flirc-remote.sh
else
    echo "Skipping Remote Control setup."
fi

if [[ "$RUN_RPI_CONFIG" == "YES" ]]; then
    echo "Launching raspi-config... "
    sudo raspi-config
else
    echo "Skipping raspi-config."
fi

source ~/.local/share/berry-player/utils/prompt-reboot.sh
# if $RUNNING_GNOME; then
#   # Install desktop tools and tweaks
#   source ~/.local/share/berry-player/install/desktop.sh

#   # Revert to normal idle and lock settings
#   gsettings set org.gnome.desktop.screensaver lock-enabled true
#   gsettings set org.gnome.desktop.session idle-delay 300
# fi