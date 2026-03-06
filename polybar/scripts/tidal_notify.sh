#!/bin/bash

PLAYER="io.github.nokse22.high-tide"
TMP_ART="/tmp/tidal_cover.jpg"

# Pega metadados básicos
TITLE=$(playerctl -p $PLAYER metadata title)
ARTIST=$(playerctl -p $PLAYER metadata artist)
ALBUM=$(playerctl -p $PLAYER metadata album)

# Baixa a capa
ART_URL=$(playerctl -p $PLAYER metadata mpris:artUrl)
curl -s "$ART_URL" -o "$TMP_ART"

# Envia a notificação limpa (Título em negrito, artista e álbum embaixo)
dunstify -u low -i "$TMP_ART" -r 9910 "$TITLE" "$ARTIST - $ALBUM"