#!/bin/sh

package_name=$(curl -s "https://www.ctan.org/json/2.0/packages" | jq '.' | rg -o '"key".*|"caption".*' | sed 's/".*: \|"//g' | sed -z 's/,\n/ - /g' | sed 's/$/\\0icon\\x1ftexstudio/g')
select_pkg=$(printf "$package_name" | fuzzel -i --dmenu --line-height=24px -p 'Paquete  > ' -w 50 -l 20 -P 10 -B 0 --font="SF Pro:size=10" | awk '{print $1}')

doc_pkg=$(curl -s "https://www.ctan.org/json/2.0/pkg/$select_pkg" | jq '.documentation' | rg -o '"details".*|"href".*' | sed 's/".*: //g' | sed -z 's/",\n"/ - /g')

ls_docs=$(
  printf "$doc_pkg" | rg "README|.md|.txt" | sed 's/$/\\0icon\\x1fnvim/g'
  printf "$doc_pkg" | rg ".html" | sed 's/$/\\0icon\\x1ffirefox/g'
  printf "$doc_pkg" | rg ".pdf" | sed 's/$/\\0icon\\x1fdocument-viewer/g'
)
urls_pkg=$(printf "$ls_docs" | fuzzel -i --dmenu --line-height=24px -p "$select_pkg docs  > " -w 50 -l 4 -P 10 -B 0 --font="SF Pro:size=10" | rg -o '/.*[^"]')

_link="https://mirrors.mit.edu/CTAN$urls_pkg"

if printf "$_link" | rg -q ".pdf"; then
  zathura "$_link" >/dev/null &
elif printf "$_link" | rg -q ".md|README|.txt"; then
  curl -sL "$_link" >"/tmp/$(printf "$_link" | sed 's|.*/||;s/%20/ /g')" && setsid -f wezterm start -- nvim -R "/tmp/$(echo "$_link" | sed 's|.*/||;s/%20/ /g')" >/dev/null &
elif printf "$_link" | rg -q ".html"; then
  firefox "$_link"
else
  exit 1
fi
