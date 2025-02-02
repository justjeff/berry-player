# Gum is used for interactive shell scripts.
GUM_VERSION="0.14.5" # Use known good version
wget -qO /tmp/gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_arm64.deb"
sudo apt-get install -y /tmp/gum.deb
rm /tmp/gum.deb