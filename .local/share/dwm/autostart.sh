#!/bin/bash

systemctl --user stop dwm-session.target
systemctl --user start dwm-session.target

setxkbmap -option ctrl:nocaps

picom -b
pgrep udiskie || udiskie -qAT --no-appindicator &
keepassxc &
if [ -d /usr/libexec ]; then
       mate-polkit &
       /usr/libexec/geoclue-2.0/demos/agent &
else
       /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
       /usr/lib/geoclue-2.0/demos/agent
fi
pgrep redshift || redshift &
pgrep -f slock-dbus || slock-dbus &
pgrep dwmblocks || dwmblocks &
nextcloud --background &
xset r rate 300 50 &
autorandr -c
~/.fehbg

# Update volume on statusbar
pkill -RTMIN+10 dwmblocks
