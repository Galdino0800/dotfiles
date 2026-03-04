#!/bin/bash

# Localização: Juazeiro do Norte
# %t = Temperatura, %c = Condição
DATA=$(curl -s "wttr.in/Juazeiro+do+Norte?format=%c+%t")

if [[ $DATA == *"Unknown"* ]] || [[ -z $DATA ]]; then
    echo "N/A"
else
    # Remove o sinal de '+' e espaços extras
    TEMP=$(echo "$DATA" | sed 's/+//g' | awk '{print $NF}')
    
    # Pega o ícone original e troca por um da Nerd Font (Opcional, mas fica mais bonito)
    # Se preferir o ícone original do site, basta usar: echo "$DATA" | sed 's/+//g'
    CONDITION=$(echo "$DATA" | awk '{print $1}')
    
    echo "$CONDITION $TEMP"
fi