#!/bin/bash

setxkbmap -option ctrl:nocaps

picom --vsync -b
pgrep udiskie || udiskie -qAT --no-appindicator &
xset r rate 300 50 &
keepassxc &
pgrep redshift || redshift &
dmenu_project Last
xss-lock -- slock &
xautolock -time 60 -locker "systemctl suspend" &
pgrep dwmblocks || dwmblocks &
/usr/bin/nextcloud --background &
