#!/bin/bash

pac=$(checkupdates 2> /dev/null | wc -l)
aur=$(yaourt -Qma | grep -c aur:)
echo $(($pac+$aur))