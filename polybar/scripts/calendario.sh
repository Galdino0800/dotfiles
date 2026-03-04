

#!/bin/bash

export LC_TIME=pt_BR.UTF-8

INFO=$(date +'%A, %d de %B de %Y' | sed 's/.*/\u&/')

TODAY=$(date +'%e' | sed 's/^ *//')

CAL=$(cal -m | sed "s/\b$TODAY\b/[$TODAY]/")

echo "$CAL" | rofi -dmenu \
    -p "" \
    -mesg "$INFO" \
    -no-custom \
    -theme-str '
window {
    width: 320px;      /* largura maior evita "..." */
    location: north east;
    anchor: north east;
    x-offset: -10;
    y-offset: 42;
    border: 2px;
    border-radius: 8px;
    border-color: #00BFFF;
    background-color: #111111;
}

mainbox { 
    children: [ "message", "listview" ]; 
}

message {
    padding: 8px;
    background-color: #1a1a1a;
}

textbox {
    font: "JetBrainsMono Nerd Font 10";
    text-color: #cccccc;
    horizontal-align: 0.5;
}

listview {
    lines: 7;
    fixed-height: true;
    dynamic: false;    /* impede redimensionamento estranho */
    padding: 6px;
}

element {
    font: "JetBrainsMono Nerd Font 11";
    text-color: #e6e6e6;
}

element selected {
    background-color: #1f1f1f;
}
'
