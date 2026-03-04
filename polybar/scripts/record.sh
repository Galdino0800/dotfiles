#!/usr/bin/env bash

DEST="$HOME/Vídeos/Screencasts"
mkdir -p "$DEST"

PIDFILE="/tmp/screencast.pid"
STARTFILE="/tmp/screencast_start"

toggle_recording() {

    # SE ESTIVER GRAVANDO → PARA
    if [ -f "$PIDFILE" ]; then
        kill -INT "$(cat "$PIDFILE")" 2>/dev/null
        rm -f "$PIDFILE"
        rm -f "$STARTFILE"
        notify-send "Screencast" "Gravação salva em Screencasts"
        exit 0
    fi

    # SE NÃO ESTIVER → INICIA
    DT=$(date "+%d-%m-%Y_%H-%M-%S")
    FILE="$DEST/rec_$DT.mp4"
    RESOLUTION=$(xdpyinfo | awk '/dimensions/{print $2}')

    notify-send "Screencast" "Gravação iniciada"

    ffmpeg -y \
        -f x11grab \
        -video_size "$RESOLUTION" \
        -framerate 60 \
        -i :0.0 \
        -c:v libx264 \
        -preset ultrafast \
        -crf 23 \
        -an \
        "$FILE" > /dev/null 2>&1 &

    echo $! > "$PIDFILE"
    date +%s > "$STARTFILE"
}

toggle_recording