#!/bin/bash

# Caminho para o arquivo temporário que conta o tempo
TMP_FILE="/tmp/mpd_pause_timer"

# Pega o status do MPD
STATUS=$(mpc status | grep -o "\[playing\]\|\[paused\]")

if [ "$STATUS" = "[paused]" ]; then
    # Se não existe o arquivo de timer, cria com o timestamp atual
    if [ ! -f "$TMP_FILE" ]; then
        date +%s > "$TMP_FILE"
    fi

    START_TIME=$(cat "$TMP_FILE")
    NOW=$(date +%s)
    DIFF=$((NOW - START_TIME))

    # 600 segundos = 10 minutos
    if [ "$DIFF" -ge 600 ]; then
        mpc stop > /dev/null
        rm "$TMP_FILE"
        echo "Player Musica"
    else
        # Enquanto está pausado, mostra o nome da música
        mpc current -f "%title%"
    fi
elif [ "$STATUS" = "[playing]" ]; then
    # Se está tocando, remove o timer e mostra a música
    rm -f "$TMP_FILE"
    mpc current -f "%title%"
else
    # Se o MPD estiver parado ou fechado
    rm -f "$TMP_FILE"
    echo "Player Musica"
fi