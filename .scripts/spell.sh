#!/bin/dash

export BEMENU_OPTS='-i -l 20 -H 25 --fb "#1e1e2e" --ff "#94e2d5" --nb "#1e1e2e" --nf "#f5e0dc" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#cba6f7" --hf "#89b4fa" --nf "#f5e0dc" --af "#f5e0dc" --ab "#1e1e2e"'

menu(){
  printf "1. Ver video en mpv\n"
  printf "2. Guardar libro en RefsPDF\n"
  printf "3. Guardar wallpaper\n"
}

spell_failed(){
  notify-send "Falló el hechizo"
}

choice=$(menu | bemenu -p "Clipboard spells 🪄" | cut -d. -f1)
cbtext=$(wl-paste -n)

case $choice in
  1)
    mpv "$cbtext" || spell_failed
    break
    ;;
  2)
    wget -c -P ~/Documentos/Refs-PDF "$cbtext" &&
      notify-send "PDF descargado 📄" ||
        spell_failed
    break
    ;;
  3)
    wget -c -P ~/Pictures/wallpapers $cbtext && notify-send "Wallpaper descargado 🖼️" || spell_failed
    break
    ;;
esac
