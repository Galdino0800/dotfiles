#!/bin/bash

# Verifica se o Tidal está rodando e pegando o status
PLAYER="tidal-hifi"

if playerctl -p $PLAYER status >/dev/null 2>&1; then
    # Pega Artista - Título
    INFO=$(playerctl -p $PLAYER metadata --format "{{ artist }} - {{ title }}")
    # Limita o tamanho para não quebrar sua barra de 1366x768
    echo "${INFO:0:30}"
else
    echo "Tidal Offline"
fi