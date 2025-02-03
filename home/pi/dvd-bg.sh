#!/bin/bash

IMAGE_DIR="/usr/share/backgrounds"
IMAGE_FILE=$(find "$IMAGE_DIR" -maxdepth 1 -iname "dvd.*" -print -quit)

# Check if an image file was found
if [ -z "$IMAGE_FILE" ]; then
  echo "Error: No DVD image file found in $IMAGE_DIR"
  exit 1
fi

# Display the image using fim
fim -T 1 -a -q "$IMAGE_FILE"