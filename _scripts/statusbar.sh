#!/usr/bin/env bash

## launch waybar with alt config

DIR="$HOME/.config/hypr/waybar"
CONFIG="$DIR/config.jsonc"
STYLE="$DIR/style.css"

trap "killall waybar" EXIT

while true; do
	waybar --bar main-bar --log-level error --config "${CONFIG}" --style "${STYLE}" &
	inotifywait -e create,modify "$DIR"
	killall waybar
done
