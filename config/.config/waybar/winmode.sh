#!/bin/sh

_state=$(hyprctl -j activewindow | jq '.floating, .fullscreen')

if echo "$_state" | rg -Uq "false\ntrue"; then
	printf "[M]"
elif echo "$_state" | rg -Uq "true\nfalse"; then
	printf ""
else
	printf "[]="
fi
