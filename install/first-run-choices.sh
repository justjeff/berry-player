THEMES=("basic" "catppuccin")
DEFAULT_THEME='basic'
export SELECTED_THEME=$(gum choose "${THEMES[@]}" --limit 1 --selected $DEFAULT_THEME --height 7 --header "Select theme." | tr ' ' '-')

VLC_PASS=$(gum input --password --placeholder "Enter a password for the web app and press [ENTER]: ")

YES="I have a remote and would like to set it up."
NO="I do not have a remote, or I would like to postpone setup."
echo "Do you have a remote? Would you like to set it up now? You can always set this up later by running the berry-player command."
export RUN_REMOTE_CONFIG=$(gum choose "$YES" "$NO")

YES="Yes, please!"
NO="No thanks!"
echo "Do you want to run raspi-config? This will launch after all other installation."
export RUN_RPI_CONFIG=$(gum choose "$YES" "$NO")