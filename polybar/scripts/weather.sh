#!/bin/bash

# 1. Tenta pegar o clima usando o formato 3 (mais leve do wttr.in)
# O timeout de 5 segundos evita que a barra trave se o site demorar
WEATHER=$(curl -s --connect-timeout 5 "wttr.in/Juazeiro+do+Norte?format=3")

# 2. Se a resposta contiver a palavra "render" ou "missing" (o erro que você está vendo), 
# ou se vier vazia, mostra N/A para não quebrar a barra.
if [[ "$WEATHER" == *"render"* || "$WEATHER" == *"missing"* || -z "$WEATHER" ]]; then
    echo "󰖐 N/A"
else
    # Limpa a resposta e exibe (Ex: Juazeiro do Norte: ☀️ +32°C)
    echo "$WEATHER" | sed 's/Juazeiro do Norte: //' | xargs
fi