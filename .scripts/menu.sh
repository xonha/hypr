#!/usr/bin/env bash

## launch wofi with alt config

DIR="$HOME/.config/hypr/wofi"
STYLE="$DIR/style.css"
CONFIG="$DIR/config"
COLORS="$DIR/colors"

trap "killall wofi" EXIT

while true; do
    if [[ ! `pidof wofi` ]]; then
        wofi --show drun --prompt 'Search...' --conf ${CONFIG} --style ${STYLE} --color ${COLORS}
    else
        pkill wofi
    fi &
    inotifywait -e create,modify $DIR
    killall wofi
done