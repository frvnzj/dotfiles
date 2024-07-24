#!/bin/sh

export BEMENU_OPTS='-i -l 10 -H 24 --fb "#1e1e2e" --ff "#94e2d5" --nb "#1e1e2e" --nf "#f5e0dc" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#cba6f7" --hf "#89b4fa" --nf "#f5e0dc" --af "#f5e0dc" --ab "#1e1e2e" --fn "SF Pro 10"'

select_pkg=$(curl -s "https://www.ctan.org/json/2.0/packages" | jq '.' | rg -o '"key".*|"caption".*' | sed 's/".*: \|"//g' | sed -z 's/,\n/ - /g' | bemenu -p 'LaTeX docs   : ' | awk '{print $1}')

_urls=$(curl -s "https://www.ctan.org/json/2.0/pkg/$select_pkg" | jq '.documentation' | rg -o '"details".*|"href".*' | sed 's/".*: //g' | sed -z 's/",\n"/ - /g' | bemenu -p "$select_pkg docs  : " | rg -o '/.*[^"]')

_link="https://mirrors.mit.edu/CTAN$_urls"

if echo "$_link" | rg -q ".pdf"; then
	zathura "$_link" > /dev/null &
elif echo "$_link" | rg -q ".md|README|.txt"; then
	curl -sL "$_link">"/tmp/$(echo "$_link" | sed 's|.*/||;s/%20/ /g')" && setsid -f wezterm start -- nvim -R "/tmp/$(echo "$_link" | sed 's|.*/||;s/%20/ /g')" > /dev/null &
else
	exit 1
fi
