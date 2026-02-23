#!/bin/bash

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

lock_cmd="swaylock -f -c 000000"

pgrep dunst || dunst &
pgrep udiskie || udiskie -qAT --no-appindicator &
pgrep swayidle || swayidle -w timeout 300 'wlopm --off "*"' resume 'wlopm --on "*"' timeout 305 "$lock_cmd" timeout 3600 'systemctl suspend' before-sleep "$lock_cmd" &
pkill swaybg; swaybg -i ~/Pictures/landscape_81.jpg -m fill &

# Update volume on statusbar
pkill -RTMIN+10 dwlblocks
