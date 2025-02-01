UNRESOLVED_PACKAGES=$(apt-get --dry-run autoremove | grep -Po '^Remv \K[^ ]+')
if [[ -n "$UNRESOLVED_PACKAGES" ]]; then
  echo It looks like these packages are no longer needed
  echo "$UNRESOLVED_PACKAGES"

  gum confirm "Remove packages?" && sudo apt autoremove -y
fi