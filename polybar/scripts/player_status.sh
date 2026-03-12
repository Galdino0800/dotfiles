#!/usr/bin/env bash

STATUS=$(playerctl status 2>/dev/null)

if [ "$STATUS" = "Playing" ]; then
    # Apenas o texto (Artista - Título)
    playerctl metadata --format "{{ artist }} - {{ title }}" 2>/dev/null | cut -c 1-25
elif [ "$STATUS" = "Paused" ]; then
    echo "Pausado"
else
    echo "Offline"
fi