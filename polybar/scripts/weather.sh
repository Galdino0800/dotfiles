#!/bin/bash
# Coloque sua cidade aqui entre as aspas
CITY="Juazeiro+do+Norte"

# Busca os dados com timeout de 5 segundos
WEATHER=$(curl -s --connect-timeout 5 "wttr.in/${CITY}?format=%c+%t" | tr -d '\n')

if [ -z "$WEATHER" ] || [[ "$WEATHER" == *"S/ Conexão"* ]]; then
    echo "Indisponível"
else
    # Tradução de ícones para Nerd Font
    WEATHER=$(echo "$WEATHER" | sed 's/☀️/󰖙/g' | sed 's/☁️/󰖐/g' | sed 's/⛅/󰖕/g' | sed 's/🌧️/󰖗/g' | sed 's/⛈️/󰖓/g' | sed 's/🌨️/󰼶/g' | sed 's/🌫️/󰖑/g')
    echo "$WEATHER"
fi