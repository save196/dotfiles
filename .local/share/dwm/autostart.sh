#!/bin/bash
setxkbmap -option ctrl:nocaps
xss-lock -- slock -m 'Screen Locked' &
#xss-lock --transfer-sleep-lock -- i3lock-custom --nofork &
xautolock -time 60 -locker "systemctl suspend" &
dwmblocks >/dev/null 2>&1 &
picom --vsync -b
~/.fehbg &
xset r rate 300 50 &
redshift -l 60.192059:24.945831 &
udiskie -qAT &
/usr/bin/nextcloud --background &
keepassxc &
