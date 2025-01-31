# raspberry-pi-dvd-player

Use a Raspberry Pi as a DVD player

<img src="https://user-images.githubusercontent.com/292958/70397346-646b4180-1a09-11ea-8db0-77495daece20.jpg" height="300" /> <img src="https://user-images.githubusercontent.com/292958/70397347-646b4180-1a09-11ea-9add-0aa2a3a5bebf.jpg" height="300" />

Features:
- Automatically play a DVD as soon as it is inserted
- Skips trailers, etc. by default
- Entirely console and framebuffer based playback (i.e. no X11/Wayland) so very low power and quick to boot
- Use any existing IR remote to play/pause/rewind/forward
- Turns screen on automatically when a DVD is inserted
- DVD splash screen
- Silent boot

## DVD Player Setup

Hardware:
- A micro SD card, 64GB+
- A Raspberry Pi 4+ or Zero 2W+
- A USB DVD drive
- [Flirc USB dongle](https://flirc.tv/more/flirc-usb)

1. Install [Rasbian Lite](https://www.raspberrypi.org/downloads/raspbian/) on the micro SD card

2. Purchase a MPEG2 license from [here](http://www.raspberrypi.com/mpeg-2-license-key/). You will need the serial number from your Raspberry Pi which can be found by running `cat /proc/cpuinfo`.

3. Add the serial number to `/boot/config.txt`. You will receive an email telling you what to add.

4. On your Pi, run this command:
```shell
wget -q0- https://raw.githubusercontent.com/justjeff/berry-player/main/boot.sh
```

## Remote control setup

1. Assign the keys on your remote to regular keys. Do not use the `play/pause`, `fastforward`, etc. commands.

```shell
flirc_util record p # Press play/pause
flirc_util record r # Press rewind
flirc_util record f # Press fast forward
flirc_util record s # Press stop
```
2. Enable the service:

```shell
sudo systemctl enable dvd-remote 
```

 ## Automatically turn on the screen when a DVD is inserted
 
 (HDMI-CEC compatible screen only.)
 
 1. To prevent the screen turning on when the Pi boots, add the following to `/boot/config.txt`:
 
 ```
 hdmi_ignore_cec_init=1
 ```
 

## DVD background and quiet boot


5. To show a blank screen when booting the following to the first line of `/boot/cmdline.txt`:

```
loglevel=3 quiet logo.nologo vt.global_cursor_default=0
```

6. To hide boot output while the Raspberry Pi boots change `console=tty1` to `console=tty3` in `/boot/cmdline.txt`.
