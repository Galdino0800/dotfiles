#!/usr/bin/env bash

dir="$HOME/.config/rofi/theme"
theme="powermenu"

uptime="System: UP - $(uptime -p | sed -e 's/up //g')"

# Ícone e nome juntos
lock="󰂭 Bloquear"
suspend=" Suspender"
logout="󰍃 Sair"
reboot="󱍸 Reiniciar"
shutdown=" Desligar"

run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | \
		rofi -dmenu \
			 -p "Adeus" \
			 -mesg "$uptime" \
			 -theme ${dir}/${theme}.rasi
}

chosen="$(run_rofi)"
case ${chosen} in
    $shutdown) systemctl poweroff ;;
    $reboot) systemctl reboot ;;
    $lock) i3lock ;;
    $suspend) mpc -q pause; amixer set Master mute; systemctl suspend ;;
    $logout) i3-msg exit ;;
esac