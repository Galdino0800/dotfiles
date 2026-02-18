#!/bin/sh

sym=" "
dir="/var/run/media/$(whoami)"

if [ $# -ne 0 ]; then
  dir="${1%/}"
fi

for f in $dir/*; do
  size=$(df --output=avail -h "$f" | tail -1)
  size="${size:1}B"

  caminho=$(basename "$f")
  res="$res$sym $caminho ($size)  "
done

echo "${res%*  }"