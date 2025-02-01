echo -e "\n Audio setup..."

sudo apt install -y --no-install-recommends build-essential git autoconf automake libtool libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev libplist-dev libsodium-dev libavutil-dev libavcodec-dev libavformat-dev uuid-dev libgcrypt-dev xxd
sudo apt install -y jq libpipewire-0.3-dev libspa-0.2-bluetooth python3-dbus libdaemon-dev xmltoman pipewire wireplumber pipewire-alsa pipewire-pulse

