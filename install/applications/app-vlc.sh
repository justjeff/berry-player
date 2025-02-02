echo -e "\nInstalling VLC... "

VIDEO_APPS=(
  libdvd-pkg
  vlc
)

for app in "${VIDEO_APPS[@]}"; do
  echo -e "\nInstalling $app..."
  sudo apt-get install "$app" -y
done

sudo dpkg-reconfigure libdvd-pkg