#!/usr/bin/env bash

# Pega o volume atual e o status (Mudo ou não)
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$MUTE" = "yes" ]; then
    notify-send -u low -t 1000 "Volume" "Mudo [off]"
else
    notify-send -u low -t 1000 "Volume" "Nível: $VOLUME%"
fi