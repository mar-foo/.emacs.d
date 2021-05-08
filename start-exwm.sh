#!/bin/sh
#setxkbmap dvorak
setxkbmap gb
wal -R &
sxhkd -c /home/mario/.emacs.d/sxhkdrc &
exec dbus-launch --exit-with-session emacs -mm --debug-init
