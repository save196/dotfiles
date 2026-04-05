#!/bin/bash

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

pgrep dunst || dunst &
pgrep udiskie || udiskie -qAT --no-appindicator &
pkill -f swayidle-dbus; swayidle-dbus --lock-cmd "swaylock -f -c 000000" &
pkill swaybg; swaybg -i ~/Pictures/landscape_81.jpg -m fill &
pkill kanshy; kanshi &
/usr/bin/nextcloud --background &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Update volume on statusbar
pkill -RTMIN+10 dwlblocks
