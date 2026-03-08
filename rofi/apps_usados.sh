#!/usr/bin/env bash

dir="$HOME/.config/rofi/theme"
theme="apps_usados"

# Apenas os ícones (Nerd Font)
term=""
files="󰉋"
editor="󰅩"
web=""
music="󰝚"
conf=""

run_rofi() {
	echo -e "$term\n$files\n$editor\n$web\n$music\n$conf" | \
		rofi -dmenu \
			 -mesg "Apps" \
			 -theme ${dir}/${theme}.rasi
}

chosen="$(run_rofi)"
case ${chosen} in
    "$term") xfce4-terminal ;;
    "$files") nemo ;;
    "$editor") subl ;;
    "$web") opera ;;
    "$music") xfce4-terminal -e ncmpcpp ;;
    "$conf") lxappearance ;;
esac