#!/bin/bash

# Força IPv4 e define um tempo limite de 5 segundos para não travar a barra
DATA=$(curl -4 -s --connect-timeout 5 "wttr.in/Juazeiro+do+Norte?format=%c+%t")

if [ $? -ne 0 ] || [[ $DATA == *"Unknown"* ]] || [ -z "$DATA" ]; then
    echo "N/A"
else
    # Remove o sinal de '+' e garante que a saída esteja limpa
    echo "$DATA" | sed 's/+//g' | xargs
fi