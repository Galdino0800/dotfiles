#!/usr/bin/env bash

dir="$HOME/.config/rofi/theme"
theme="screenshot"
capture_dir="$HOME/Imagens/Screenshots"
mkdir -p "$capture_dir"

# Ícones
opt1="󰹑" # Tela Cheia
opt2="󰒅" # Seleção
opt3="󱂬" # Janela
opt4="󱎫" # 5s
opt5="󱎮" # 10s

# Formatação do arquivo
time=$(date +%Y-%m-%d-%S)
file="Screenshot_${time}.png"

# Função para rodar o Rofi
# O segredo está no -p (Prompt) que vamos atualizar visualmente
run_rofi() {
	echo -e "$opt1\n$opt2\n$opt3\n$opt4\n$opt5" | \
		rofi -dmenu \
			 -p "Captura de Ecrã" \
			 -theme ${dir}/${theme}.rasi
}

chosen="$(run_rofi)"

case ${chosen} in
    $opt1) sleep 0.5 && maim "$capture_dir/$file" ;;
    $opt2) maim -s "$capture_dir/$file" ;;
    $opt3) maim -i $(xdotool getactivewindow) "$capture_dir/$file" ;;
    $opt4) sleep 5 && maim "$capture_dir/$file" ;;
    $opt5) sleep 10 && maim "$capture_dir/$file" ;;
esac

# Copia para o clipboard se a captura foi feita
if [[ -f "$capture_dir/$file" ]]; then
    xclip -selection clipboard -t image/png -i "$capture_dir/$file"
    notify-send "󰹑 Screenshot Salva e Copiada"
fi