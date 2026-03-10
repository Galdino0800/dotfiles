#!/usr/bin/env bash

# 1. Se o processo não existe, nem tenta o resto
if ! pgrep -x "tidal-hifi" > /dev/null; then
    echo "󰓄 Offline"
    exit 0
fi

# 2. Tenta pegar o status de QUALQUER player ativo
player_status=$(playerctl status 2>/dev/null)
# 3. Tenta pegar a música de QUALQUER player ativo
metadata=$(playerctl metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)

# 4. Se não conseguiu metadados via playerctl, usa o título da janela (Plano B)
if [ -z "$metadata" ]; then
    metadata=$(xdotool getwindowname $(xdotool search --class "tidal-hifi" | tail -1) 2>/dev/null)
fi

# 5. Lógica de ícones (Sem nota musical)
if [ "$player_status" = "Paused" ]; then
    echo "󰏤 ${metadata:0:40}"
elif [ -n "$metadata" ]; then
    echo "${metadata:0:40}"
else
    echo "Tidal"
fi