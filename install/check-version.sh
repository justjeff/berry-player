#!/bin/bash

if [ ! -f /etc/os-release ]; then
    echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
    echo "Installation stopped."
    exit 1
fi

. /etc/os-release

# Check if running on Raspberry Pi OS Bookworm
if [ "$ID" != "debian" ] || [ $(echo "$VERSION_ID >= 12" | bc) != 1 ]; then
    echo "$(tput setaf 1)Error: OS requirement not met"
    echo "You are currently running: $ID $VERSION_ID"
    echo "OS required: Raspberry Pi OS/Debian Bookworm (v12) or higher"
    echo "Installation stopped."
    exit 1
fi