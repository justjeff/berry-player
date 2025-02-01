echo "Configuring the shell... \n"

# Configure the bash shell using berry-player defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/berry-player/config/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/berry-player/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using berry-player defaults
cp ~/.local/share/berry-player/config/inputrc ~/.inputrc