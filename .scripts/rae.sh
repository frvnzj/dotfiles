#!/bin/dash

export BEMENU_OPTS='-H 24 -l 10 --fb "#1e1e2e" --ff "#94e2d5" --nb "#1e1e2e" --nf "#f5e0dc" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#cba6f7" --hf "#89b4fa" --nf "#f5e0dc" --af "#f5e0dc" --ab "#1e1e2e" --fn "SF Pro 10"'

rae=$(printf "" | bemenu -p " Diccionario 📖:")
buscar=$(printf "🦊 firefox\n🐺 librewolf" | bemenu -p " Navegador 🌐" | awk '{print $2}')

$buscar https://dle.rae.es/"$rae"
