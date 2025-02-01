set -e

# ascii_art=':::::::. .,:::::: :::::::..  :::::::...-:.     ::-.
#  ;;;'';;';;;;'''' ;;;;``;;;; ;;;;``;;;;';;.   ;;;;'
#  [[[__[[\.[[cccc   [[[,/[[['  [[[,/[[['  '[[,[[['  
#  $$""""Y$$$$""""   $$$$$$c    $$$$$$c      c$$"    
# _88o,,od8P888oo,__ 888b "88bo,888b "88bo,,8P"`     
# ""YUMMMP" """"YUMMMMMMM   "W" MMMM   "W"mM"        
# ::::::::::. :::      :::.  .-:.     ::-..,:::::: :::::::..     
#  `;;;```.;;;;;;      ;;`;;  ';;.   ;;;;';;;;'''' ;;;;``;;;;    
#   `]]nnn]]' [[[     ,[[ '[[,  '[[,[[['   [[cccc   [[[,/[[['    
#    $$$""    $$'    c$$$cc$$$c   c$$"     $$""""   $$$$$$c      
#    888o    o88oo,.__888   888,,8P"`      888oo,__ 888b "88bo,  
#    YMMMb   """"YUMMMYMM   ""`mM"         """"YUMMMMMMM   "W"   

# '

# echo -e "$ascii_art"
echo "=> Berry Player is for fresh Rasberry Pi OS Bookworm installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Berry Player..."
rm -rf ~/.local/share/berry-player
git clone -b dev https://github.com/justjeff/berry-player.git ~/.local/share/berry-player >/dev/null

echo "Installation starting..."
source ~/.local/share/berry-player/install.sh