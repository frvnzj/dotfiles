#!/bin/sh

export BEMENU_OPTS='-i -l 10 -H 24 --fb "#1e1e2e" --ff "#94e2d5" --nb "#1e1e2e" --nf "#f5e0dc" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#cba6f7" --hf "#89b4fa" --nf "#f5e0dc" --af "#f5e0dc" --ab "#1e1e2e" --fn "SF Pro 10"'

_pdf=$(fd -e pdf | bemenu -p "Drag and Drop PDF  : " | sed "s/\s/\\\ /g")

if [ "$_pdf" ]; then

dragon-drop -x -i -T "$HOME"/"$_pdf" &

else

  exit 1

fi
