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

# Get the model of the device
MODEL_PATH="/sys/firmware/devicetree/base/model"
if [ ! -f $MODEL_PATH ]; then
    echo "$(tput setaf 1)Error: Unable to determine hardware. $MODEL_PATH file not found."
    echo "Installation stopped."
    exit 1
fi

MODEL=$(cat $MODEL_PATH)

# Check if the model contains "Raspberry Pi 4" or "Raspberry Pi 5" (or any newer models)
if [[ "$MODEL" == *"Raspberry Pi 4"* ]] || [[ "$MODEL" == *"Raspberry Pi 5"* ]]; then
    DEVICE_TYPE="Raspberry Pi 4 or newer"
    REQ_MPEG=0
else
    DEVICE_TYPE="Other"
    REQ_MPEG=1
fi

# Output the result
echo "Device Model: $MODEL"
echo "Device Type: $DEVICE_TYPE"