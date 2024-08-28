#!/usr/bin/env bash

trap "killall waybar" EXIT

while true; do
  waybar --bar main-bar --log-level error --config "$HOME/.config/hypr/waybar/config.jsonc" --style "$HOME/.config/hypr/waybar/style.css" &
  inotifywait -e create,modify "$HOME/.config/hypr/waybar"
  killall waybar
done
