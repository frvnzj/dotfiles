#!/bin/dash

#     ____  ___    ______
#    / __ \/   |  / ____/
#   / /_/ / /| | / __/   
#  / _, _/ ___ |/ /___   
# /_/ |_/_/  |_/_____/   

# Script para buscar palabras en la RAE.
# Dependencias: fuzzel, firefox y librewolf.

# rae="${1:-$(printf "%s" | fuzzel -d -l 0 -w 15 -y 4 -p 'Diccionario 📖:  ')}"
# buscar=$(printf "🦊 firefox\n🐺 librewolf" | fuzzel -d -l 2 -w 10 -p " Navegador 🌐 " | awk '{print $2}')

rae="${1:-$(printf "%s" | rofi -dmenu -replace -config ~/.config/rofi/config-rae.rasi -p 'Diccionario 📖')}"
buscar=$(printf "🦊 firefox\n🐺 librewolf" | rofi -dmenu -replace -config ~/.config/rofi/config-browser.rasi -p "Navegador 🌐" | awk '{print $2}')

$buscar https://dle.rae.es/"$rae"
