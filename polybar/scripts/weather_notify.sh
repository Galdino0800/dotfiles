#!/bin/bash

# Busca: Condição (%c), Temperatura (%t), Sensação (%f), Vento (%w) e Umidade (%h)
# O "Juazeiro+do+Norte" garante que pegue a cidade certa.
DATA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%c+%t+%w+%h")

# 1. Filtro de Segurança (Se o site mandar o erro de 'render failed' ou vier vazio)
if [[ "$DATA" == *"render"* || -z "$DATA" ]]; then
    echo "󰖐 Indisponível"
else
    # 2. Organiza os dados
    # O wttr.in manda algo como: ☀️ +32°C ↙15km/h 45%
    ICON=$(echo "$DATA" | awk '{print $1}')
    TEMP=$(echo "$DATA" | awk '{print $2}')
    VENTO=$(echo "$DATA" | awk '{print $3}')
    UMID=$(echo "$DATA" | awk '{print $4}')

    # 3. Saída para a Polybar ou Notificação
    # Formato: ☀️ 32°C | 󰖝 15km/h | 󰖐 45%
    echo "$ICON $TEMP | 󰖝 $VENTO | 󰍟 $UMID"
fi