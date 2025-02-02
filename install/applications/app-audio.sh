echo -e "\nAudio setup..."

# List of applications to install
APPS=(
  pipewire          # The PipeWire multimedia processing framework.
  wireplumber       # A session manager for PipeWire, managing audio and video streams.
  pipewire-alsa     # ALSA support for PipeWire, allowing it to act as an ALSA audio server.
  pipewire-pulse    # PulseAudio compatibility layer for PipeWire, allowing applications that use PulseAudio to work with PipeWire.
)

# Loop through each application and install it
for app in "${APPS[@]}"; do
  echo -e "\nInstalling $app..."
  sudo apt-get install "$app" -y
done