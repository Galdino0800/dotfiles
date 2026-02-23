#!/bin/bash

# Pequena pausa para o MPD atualizar as informações da música
sleep 0.5

# Define a pasta de músicas (ajusta se a tua pasta for 'Musica' sem acento)
MUSIC_DIR="$HOME/Músicas"

# Obtém o caminho do ficheiro atual
FILE_PATH=$(mpc current -f %file%)
ALBUM_DIR="$MUSIC_DIR/$(dirname "$FILE_PATH")"

# Define onde guardar a capa temporária
COVER="/tmp/cover.jpg"
rm "$COVER" 2>/dev/null

# Tenta extrair a capa embutida no MP3 usando ffmpeg
ffmpeg -i "$MUSIC_DIR/$FILE_PATH" -an -vcodec copy "$COVER" -y -loglevel quiet

# Se não houver capa embutida, procura por uma imagem na pasta do álbum
if [ ! -f "$COVER" ]; then
    COVER=$(find "$ALBUM_DIR" -maxdepth 1 -type f | grep -E -i "cover|folder|front|album" | head -n 1)
fi

# Se não encontrar nenhuma imagem, usa um ícone padrão do sistema
[ -z "$COVER" ] && COVER="audio-x-generic"

# Envia a notificação limpa (Sem o 0%)
# -h string:x-dunst-stack-tag:music garante que uma notificação substitui a outra
notify-send -h string:x-dunst-stack-tag:music \
            -i "$COVER" \
            "♫ Tocando Agora" \
            "$(mpc current -f '%artist% - %title%')"