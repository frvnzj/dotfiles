#!/bin/dash

export BEMENU_OPTS='-H 20 --fb "#1e1e2e" --ff "#94e2d5" --nb "#1e1e2e" --nf "#f5e0dc" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#cba6f7" --hf "#89b4fa" --nf "#f5e0dc" --af "#f5e0dc" --ab "#1e1e2e"'

rae=$(printf "" | bemenu -p " Diccionario 📖:")

notify-send "Buscando en diccionario 🔎"
$BROWSER https://dle.rae.es/"$rae"
