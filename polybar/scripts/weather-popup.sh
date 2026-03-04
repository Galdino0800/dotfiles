#!/usr/bin/env bash

CITY="Juazeiro do Norte,BR"
CACHE="/tmp/weather_cache"

weather=$(cat "$CACHE")

temp=$(echo "$weather" | jq -r '.current_condition[0].temp_C')
feels=$(echo "$weather" | jq -r '.current_condition[0].FeelsLikeC')
cond=$(echo "$weather" | jq -r '.current_condition[0].weatherDesc[0].value')
wind=$(echo "$weather" | jq -r '.current_condition[0].windspeedKmph')
tomorrow_temp=$(echo "$weather" | jq -r '.weather[1].avgtempC')

notify-send "Clima – Juazeiro do Norte" \
"$cond

🌡️ Temperatura: $temp°C
🤒 Sensação: $feels°C
🌬️ Vento: ${wind} km/h
📆 Amanhã: ${tomorrow_temp}°C"