#!/bin/sh

export BEMENU_OPTS='-i -l 20 -H 25 --fb "#1e1e2e" --ff "#94e2d5" --nb "#1e1e2e" --nf "#f5e0dc" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#cba6f7" --hf "#89b4fa" --nf "#f5e0dc" --af "#f5e0dc" --ab "#1e1e2e"'

menu(){
  printf "1. Copiar imagen 🖼️\n"
  printf "2. Borrar imagen ✂️\n"
  printf "3. Cambiar wallpaper 💻\n"
}

spell_failed(){
  notify-send "Interrumpido 🛑"
}

choice=$(menu | bemenu -p "Imagen Spells 🧙🏽" | cut -d. -f1)
img=$(fd . '/home/frvnzj/' -e png -e jpg | sort -u | bat)
preview=$(nsxiv -to $img)

case $choice in
  1)
    wl-copy < $preview && notify-send "Imágen en clipboard 📎" || spell_failed
    break
    ;;
  2)
    rm $preview && notify-send "File(s) erased ✂️" || spell_failed
    break
    ;;
  3)
    swaybg -m fill -i $preview >/dev/null 2>&1 && notify-send "Nuevo wallpaper 💻" || spell_failed
    break
    ;;
esac
