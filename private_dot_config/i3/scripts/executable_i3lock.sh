#!/bin/sh

overlay=/usr/share/pixmaps/lockoverlay.png

scrot /tmp/currentworkspace.png
convert /tmp/currentworkspace.png -blur 0x5 /tmp/lockbackground.png
i3lock -i /tmp/lockbackground.png
