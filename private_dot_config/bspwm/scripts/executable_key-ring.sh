#!/bin/bash

dbus-update-activation-environment --all
#Start the Gnome polkit agent
gnome-keyring-daemon --start --components=secrets
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
