# #!/bin/bash

# if [ ! -f /etc/os-release ]; then
#     echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
#     echo "Installation stopped."
#     exit 1
# fi

# . /etc/os-release

# # Check if running on Raspberry Pi OS Bookworm
# if [ "$ID" != "debian" ] || [ $(echo "$VERSION_ID >= 12" | bc) != 1 ]; then
#     echo "$(tput setaf 1)Error: OS requirement not met"
#     echo "You are currently running: $ID $VERSION_ID"
#     echo "OS required: Raspberry Pi OS/Debian Bookworm (v12) or higher"
#     echo "Installation stopped."
#     exit 1
# fi

# # Get the model of the device
# MODEL_PATH="/sys/firmware/devicetree/base/model"
# if [ ! -f $MODEL_PATH ]; then
#     echo "$(tput setaf 1)Error: Unable to determine hardware. $MODEL_PATH file not found."
#     echo "Installation stopped."
#     exit 1
# fi

# MODEL=$(cat $MODEL_PATH | tr -d '\0')

# # Check if the model contains "Raspberry Pi 4" or "Raspberry Pi 5" (or any newer models)
# if [[ "$MODEL" == *"Raspberry Pi 4"* ]] || [[ "$MODEL" == *"Raspberry Pi 5"* ]]; then
#     DEVICE_TYPE="Raspberry Pi 4 or newer"
#     REQ_MPEG=0
# else
#     DEVICE_TYPE="Other"
#     REQ_MPEG=1
# fi

# Gets device information
is_pi () {
  ARCH=$(dpkg --print-architecture)
  if [ "$ARCH" = "armhf" ] || [ "$ARCH" = "arm64" ] ; then
    return 0
  else
    return 1
  fi
}

is_64bit () {
  ARCH=$(dpkg --print-architecture)
  if [ "$ARCH" = "arm64" ] ; then
    return 0
  else
    return 1
  fi
}

if is_pi ; then
  if [ -e /proc/device-tree/chosen/os_prefix ]; then
    PREFIX="$(tr -d '\0' < /proc/device-tree/chosen/os_prefix)"
  fi
  CMDLINE="/boot${FIRMWARE}/${PREFIX}cmdline.txt"
else
  CMDLINE=/proc/cmdline
fi

# tests for Pi 1, 2 and 0 all test for specific boards...

is_pione() {
  if grep -q "^Revision\s*:\s*00[0-9a-fA-F][0-9a-fA-F]$" /proc/cpuinfo; then
    return 0
  elif grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]0[0-36][0-9a-fA-F]$" /proc/cpuinfo ; then
    return 0
  else
    return 1
  fi
}

is_pitwo() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]04[0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

is_pizero() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]0[9cC][0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

# ...while tests for Pi 3 and 4 just test processor type, so will also find CM3, CM4, Zero 2 etc.

is_pithree() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F]2[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

is_pifour() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F]3[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

is_pifive() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F]4[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

is_cmfive() {
  grep -q "^Revision\s*:\s*[ 123][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]1[8aA][0-9a-fA-F]$" /proc/cpuinfo
  return $?
}

get_pi_type() {
  if is_pione; then
    echo 1
  elif is_pitwo; then
    echo 2
  elif is_pithree; then
    echo 3
  elif is_pifour; then
    echo 4
  elif is_pifive; then
    echo 5
  elif is_pizero; then
    echo 0
  else
    echo -1
  fi
}

deb_ver () {
  ver=$(cut -d . -f 1 < /etc/debian_version)
  echo $ver
}

get_package_version() {
  dpkg-query --showformat='${Version}' --show "$1"
}

# Check and output
if is_pi; then
  PI_TYPE=$(get_pi_type)
  DEB_VERSION=$(deb_ver)

  if [ "$PI_TYPE" -eq 4 ] && [ "$DEB_VERSION" -ge 12 ]; then
    echo "Supported system: Raspberry Pi 4+ on Debian Bookworm 12+"
    exit 0
  else
    echo "Unsupported system: This script requires Raspberry Pi 4+ on Debian Bookworm 12+."
    exit 1
  fi
else
  echo "Unsupported system: This script is intended for Raspberry Pi devices."
  exit 1
fi