#!/bin/bash

# Busca o clima de Juazeiro do Norte
# Usamos o formato 1 para pegar dados detalhados se necessário
RESPONSE=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%c+%t+%f")

# O PULO DO GATO: Se a resposta contiver "render failed", a gente ignora.
if [[ "$RESPONSE" == *"render failed"* || -z "$RESPONSE" ]]; then
    TEMP="Indisponível"
    SENSACAO="--"
    ICON="󰖐"
else
    # Se estiver ok, extrai os dados (ajuste conforme seu script original)
    ICON=$(echo $RESPONSE | awk '{print $1}')
    TEMP=$(echo $RESPONSE | awk '{print $2}')
    SENSACAO=$(echo $RESPONSE | awk '{print $3}')
fi

# Envia para a notificação (Dunst)
notify-send -a "Clima" "Clima em Juazeiro" "Temperatura: $TEMP\nSensação: $SENSACAO" -i weather-clear