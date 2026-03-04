#!/usr/bin/env bash

PIDFILE="/tmp/screencast.pid"
STARTFILE="/tmp/screencast_start"

ICON=""

if [ -f "$PIDFILE" ]; then

    # TEMPO DECORRIDO
    if [ -f "$STARTFILE" ]; then
        START=$(cat "$STARTFILE")
        NOW=$(date +%s)
        ELAPSED=$((NOW - START))

        MIN=$((ELAPSED / 60))
        SEC=$((ELAPSED % 60))

        TIME=$(printf "%02d:%02d" "$MIN" "$SEC")
    else
        TIME="00:00"
    fi

    # EFEITO PISCAR
    if [ $(( $(date +%s) % 2 )) -eq 0 ]; then
        echo "%{F#ff0000}$ICON%{F-} $TIME"
    else
        echo "%{F#ff0000} $TIME%{F-}"
    fi

else
    echo "$ICON"
fi