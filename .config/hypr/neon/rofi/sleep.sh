#!/bin/sh
swayidle -w \
                timeout 320 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
                    resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
                timeout 1200 "$HOME/.config/hypr/scripts/lock.sh & sleep 1 && hyprctl dispatch dpms off" \
                    resume 'hyprctl dispatch dpms on' \
                timeout 1800 'systemctl suspend'
