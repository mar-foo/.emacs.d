#!/bin/sh
#setxkbmap dvorak
wal -R &
sxhkd -c /home/mario/.emacs.d/sxhkdrc &
exec dbus-launch --exit-with-session emacsclient -c -e '(load-file "/home/mario/.emacs.d/exwm.el")'
