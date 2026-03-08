#!/usr/bin/env bash

dir="$HOME/.config/rofi/theme"
theme="powermenu"

uptime="System: UP - $(uptime -p | sed -e 's/up //g')"

# Ícones e nomes
lock="󰂭 Bloquear"
suspend=" Suspender"
logout="󰍃 Sair"
reboot="󱍸 Reiniciar"
shutdown=" Desligar"

run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | \
		rofi -dmenu \
			 -p "Até logo" \
			 -mesg "$uptime" \
			 -theme ${dir}/${theme}.rasi
}

chosen="$(run_rofi)"

case ${chosen} in
    $lock)
        # Usando o caminho absoluto para evitar erros de diretório
        bash /home/ghost/.config/i3/ilockit/ilockit &
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        bash /home/ghost/.config/i3/ilockit/ilockit & sleep 1 && systemctl suspend
        ;;
    $logout)
        i3-msg exit
        ;;
    $reboot)
        systemctl reboot
        ;;
    $shutdown)
        systemctl poweroff
        ;;
esac