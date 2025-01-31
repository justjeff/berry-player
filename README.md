# Berry Player

Setup files for using a Raspberry Pi as a headless DVD host.

Features:

- Automatically play a DVD as soon as it is inserted
- Skips trailers, etc. by default
- Entirely console and framebuffer based playback (i.e. no X11/Wayland) so very low power and quick to boot
- Use any existing IR remote to play/pause/rewind/forward
- Turns screen on automatically when a DVD is inserted
- DVD splash screen
- Silent boot

Hardware:

- A micro SD card, 64GB+
- A Raspberry Pi 4+ or Zero 2W+
- A USB DVD drive
- [Flirc USB dongle](https://flirc.tv/more/flirc-usb)
- IR Remote Control

## Setup

1. Install [Rasbian Lite](https://www.raspberrypi.org/downloads/raspbian/) on the micro SD card

2. Purchase a MPEG2 license from [here](http://www.raspberrypi.com/mpeg-2-license-key/). You will need the serial number from your Raspberry Pi which can be found by running `cat /proc/cpuinfo`.

3. Add the serial number to `/boot/config.txt`. You will receive an email telling you what to add.

4. On your Pi, run this command:

```shell
wget -q0- https://raw.githubusercontent.com/justjeff/berry-player/main/boot.sh
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
