#!/bin/bash

if pgrep -x "picom" > /dev/null
then
	pkill picom && picom -b --config $HOME/.config/picom/ftlabs-picom.conf
else
	picom -b --config $HOME/.config/picom/ftlabs-picom.conf
fi