#!/usr/bin/env bash

## Simple Script To Pick Color Quickly.

color=$(hyprpicker)
image=/tmp/${color}.png

main() {
  if [[ "$color" ]]; then
    # copy color code to clipboard
    echo "$color" | tr -d "\n" | wl-copy
    # generate preview
    convert -size 48x48 xc:"$color" "${image}"
    # notify about it
    notify-send -h string:x-canonical-private-synchronous:sys-notify-picker -u low -i "${image}" "$color, copied to clipboard."
  fi
}

# Run the script
main
