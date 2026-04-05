#!/bin/bash

setxkbmap -option ctrl:nocaps

picom --backend glx --vsync -b
pgrep udiskie || udiskie -qAT --no-appindicator &
xset r rate 300 50 &
keepassxc &
pgrep redshift || redshift &
autorandr -c
~/.fehbg
pgrep -f slock-dbus || slock-dbus &
pgrep dwmblocks || dwmblocks &
/usr/bin/nextcloud --background &

# Update volume on statusbar
pkill -RTMIN+10 dwmblocks
