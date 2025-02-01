# Display system information in the terminal
# sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
# sudo apt update -y
# sudo apt install -y fastfetch

wget -qO fastfetch.tar.gz https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-aarch64.tar.gz
sudo tar xf fastfetch.tar.gz --strip-components=3 -C /usr/local/bin fastfetch-linux-aarch64/usr/bin/fastfetch



# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Berry Player fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/berry-player/config/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi

fastfetch