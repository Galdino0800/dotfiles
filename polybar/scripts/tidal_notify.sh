#!/usr/bin/env bash

# 1. Busca qualquer player que contenha 'chromium' ou 'tidal'
PLAYER=$(playerctl -l 2>/dev/null | grep -iE "chromium|tidal" | head -n 1)

# Se não achou por nome, mas o processo existe, tenta pegar o primeiro player disponível
if [ -z "$PLAYER" ]; then
    PLAYER=$(playerctl -l 2>/dev/null | head -n 1)
fi

# DEBUG: Se ainda estiver vazio, avisa no terminal
if [ -z "$PLAYER" ]; then
    echo "Erro: Nenhum player encontrado pelo playerctl."
    exit 0
fi

# 2. Extrai os metadados
TITULO=$(playerctl --player="$PLAYER" metadata xesam:title 2>/dev/null)
ARTISTA=$(playerctl --player="$PLAYER" metadata xesam:artist 2>/dev/null)
ART_URL=$(playerctl --player="$PLAYER" metadata mpris:artUrl 2>/dev/null)

# 3. Limpa o caminho da capa
ART_PATH=$(echo "$ART_URL" | sed 's/file:\/\///')

# 4. Define o ícone
if [ -f "$ART_PATH" ]; then
    ICON="$ART_PATH"
else
    ICON="audio-x-generic"
fi

# 5. Define o Status
STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null)
[ "$STATUS" = "Paused" ] && HEADER="Pausado" || HEADER="Tocando agora"

# 6. Envia a notificação
notify-send -r 999 -i "$ICON" -a "Tidal" "$HEADER" "<b>$TITULO</b>\n<i>$ARTISTA</i>"

# DEBUG: Confirmação no terminal
echo "Notificação enviada para o player: $PLAYER"