#!/bin/bash

# Pega o volume atual e o status de mute (usando o pactl que é padrão no Arch)
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -n 1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# Define o ícone com base no volume e no mute
if [ "$MUTE" = "yes" ] || [ "$VOLUME" -eq 0 ]; then
    ICON="󰝟"
    TEXT="Mudo"
elif [ "$VOLUME" -lt 30 ]; then
    ICON="󰕿"
    TEXT="Baixo"
elif [ "$VOLUME" -lt 70 ]; then
    ICON="󰖀"
    TEXT="Médio"
else
    ICON="󰕾"
    TEXT="Alto"
fi

# A MÁGICA: O Dunst aceita uma "stack tag" para não empilhar várias notificações
# e o valor "value" cria a barra de progresso automática
dunstify -a "Volume" -u low -h string:x-dunst-stack-tag:volume -h int:value:"$VOLUME" "$ICON  $VOLUME%" "$TEXT"