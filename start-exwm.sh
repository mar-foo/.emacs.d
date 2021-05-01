#!/bin/sh
#setxkbmap dvorak
sxhkd -c /home/mario/.emacs.d/sxhkdrc &
exec dbus-launch --exit-with-session emacs-27 -mm --debug-init
