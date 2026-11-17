#!/bin/bash

# Start a program in the background, skipping it if it is not installed.
run() {
	if ! command -v "$1" >/dev/null 2>&1; then
		echo "dwl autostart: $1 not found" >&2
		return 0
	fi
	"$@" &
}

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
systemctl --user stop dwl-session.target
systemctl --user start dwl-session.target

pkill udiskie
run udiskie -qAT --no-appindicator
pkill -f "wayidle daemon"
run wayidle daemon --lock-cmd "swaylock -f -c 000000"
pkill swaybg
run swaybg -i ~/Pictures/landscape_81.jpg -m fill
pkill kanshi
run kanshi
run /usr/bin/nextcloud --background
run /usr/bin/keepassxc --minimized
if [ -d /usr/libexec ]; then
	run /usr/libexec/polkit-mate-authentication-agent-1
	run /usr/libexec/geoclue-2.0/demos/agent
else
	run /usr/lib/mate-polkit/polkit-mate-authentication-agent-1
	run /usr/lib/geoclue-2.0/demos/agent
fi

# Update volume on statusbar
pkill -RTMIN+10 dwlblocks
