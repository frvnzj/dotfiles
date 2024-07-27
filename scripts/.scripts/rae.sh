#!/bin/sh

#     ____  ___    ______
#    / __ \/   |  / ____/
#   / /_/ / /| | / __/   
#  / _, _/ ___ |/ /___   
# /_/ |_/_/  |_/_____/   

# Script para buscar palabras en la RAE.
# Dependencias: fuzzel, firefox y librewolf.

rae="${1:-$(printf "%s" | fuzzel --dmenu -p "Diccionario > " -l 0 -w 10 -P 0)}"
buscar=$(echo -en "firefox\0icon\x1ffirefox\nlibrewolf\0icon\x1flibrewolf" | fuzzel --dmenu -p "Navegador > " -l 2 -w 10 -P 10)

$buscar https://dle.rae.es/"$rae"
