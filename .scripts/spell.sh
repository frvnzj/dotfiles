#!/bin/dash

menu() {
	printf "1. Ver video en mpv\n"
	printf "2. Guardar libro en RefsPDF\n"
	printf "3. Guardar wallpaper\n"
	printf "4. Descargar video\n"
	printf "5. Editar/Guardar RAW\n"
	printf "6. Abrir en Librewolf\n"
}

spell_failed() {
	notify-send "Falló el hechizo"
}

choice=$(menu | rofi -dmenu -p "Clipboard spells 🪄" | cut -d. -f1)
cbtext=$(wl-paste -n)

case $choice in
1)
	setsid -f mpv -quiet "$cbtext" >/dev/null 2>&1 || spell_failed
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
4)
	qndl "$cbtext" >/dev/null 2>&1 || spell_failed
	break
	;;
5)
	curl -sL "$cbtext" >"/tmp/$(echo "$cbtext" | sed "s|.*/||;s/%20/ /g")" && setsid -f wezterm -e nvim "/tmp/$(echo "$cbtext" | sed "s|.*/||;s/%20/ /g")" >/dev/null 2>&1 || spell_failed
	break
	;;
6)
	setsid -f librewolf "$cbtext" >/dev/null 2>&1 || spell_failed
	break
	;;
esac
