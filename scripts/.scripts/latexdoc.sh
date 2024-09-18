#!/bin/sh

package_name=$(curl -s "https://www.ctan.org/json/2.0/packages" | jq '.' | rg -o '"key".*|"caption".*' | sed 's/".*: \|"//g' | sed -z 's/,\n/ - /g' | sed 's/$/\\0icon\\x1ftexstudio/g')
select_pkg=$(printf "$package_name" | fuzzel -i --dmenu --line-height=24px -p 'Paquete  > ' -w 50 -l 20 -P 10 -B 0 --font="SF Pro:size=10" | awk '{print $1}')

doc_pkg=$(curl -s "https://www.ctan.org/json/2.0/pkg/$select_pkg" | jq '.documentation' | rg -o '"details".*|"href".*' | sed 's/".*: //g' | sed -z 's/",\n"/ - /g')
ls_docs=$(
  printf "$doc_pkg" | awk ' 
    /README"$|\.md"$|\.txt"$/ {print $0 "\\0icon\\x1fnvim"}
    /\.html"$/ {print $0 "\\0icon\\x1ffirefox"}
    /\.pdf"$/ {print $0 "\\0icon\\x1fdocument-viewer"}
   '
)
urls_pkg=$(printf "$ls_docs" | fuzzel -i --dmenu --line-height=24px -p "$select_pkg docs  > " -w 50 -l 4 -P 10 -B 0 --font="SF Pro:size=10" | rg -o '/.*[^"]')

_link="https://mirrors.mit.edu/CTAN$urls_pkg"

if printf "$_link" | rg -q ".pdf"; then
  zathura "$_link" >/dev/null &
elif printf "$_link" | rg -q ".md|README|.txt"; then
  curl -sL "$_link" >"/tmp/$(printf "$_link" | sed 's|.*/||;s/%20/ /g')" && setsid -f kitty -1 nvim -R "/tmp/$(echo "$_link" | sed 's|.*/||;s/%20/ /g')" >/dev/null &
elif printf "$_link" | rg -q ".html"; then
  xdg-open "$_link"
else
  exit 1
fi
