#!/usr/bin/env bash

## Script To Manage Speaker Volume For Archcraft (in Wayland).

DIR="$HOME/.config/hypr/notification/icons"
notify_cmd='notify-send -h string:x-canonical-private-synchronous:sys-notify-volume -u low'

# Get Volume
get_volume() {
  pulsemixer --get-volume | cut -d' ' -f1
}

# Get icons
get_icon() {
  current="$(get_volume)"
  if [[ "$current" -eq "0" ]]; then
    icon="$DIR/volume-mute.png"
  elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
    icon="$DIR/volume-low.png"
  elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
    icon="$DIR/volume-mid.png"
  elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
    icon="$DIR/volume-high.png"
  fi
}

notify_user() {
  ${notify_cmd} -i "$icon" "Volume : $(get_volume)%"
}

inc_volume() {
  [[ $(pulsemixer --get-mute) == 1 ]] && pulsemixer --unmute
  pulsemixer --max-volume 100 --change-volume +5 && get_icon && notify_user
}

dec_volume() {
  [[ $(pulsemixer --get-mute) == 1 ]] && pulsemixer --unmute
  pulsemixer --max-volume 100 --change-volume -5 && get_icon && notify_user
}

# Toggle Mute
toggle_mute() {
  if [[ $(pulsemixer --get-mute) == 0 ]]; then
    pulsemixer --toggle-mute && ${notify_cmd} -i "$DIR/volume-mute.png" "Mute"
  else
    pulsemixer --toggle-mute && get_icon && ${notify_cmd} -i "$icon" "Unmute"
  fi
}

toggle_mic() {
  # Find the default source
  DEFAULT_SOURCE=$(pulsemixer --list-sources | grep 'Default')
  DEFAULT_ID=$(echo "$DEFAULT_SOURCE" | cut -d',' -f1 | cut -d' ' -f3)
  DEFAULT_MUTE_STATUS=$(echo "$DEFAULT_SOURCE" | grep -o 'Mute: [0-1]' | cut -d' ' -f2)

  # Toggle the default source
  if [ "$DEFAULT_MUTE_STATUS" == "1" ]; then
    pulsemixer --id "$DEFAULT_ID" --unmute
  else
    pulsemixer --id "$DEFAULT_ID" --mute
  fi

  # Get all source IDs
  IDS=$(pulsemixer --list-sources | grep 'Source:' | cut -d',' -f1 | cut -d' ' -f3)

  # Split the string into an array
  IFS=$'\n'
  read -d '' -ra IDS_ARRAY <<<"$IDS"

  # Iterate over each source ID
  for ID in "${IDS_ARRAY[@]}"; do
    if [ "$DEFAULT_MUTE_STATUS" == "1" ]; then
      pulsemixer --id "$ID" --unmute
    else
      pulsemixer --id "$ID" --mute
    fi
  done
}

mute_mic() {
  IDS="$(pulsemixer --list-sources | grep 'Source:' | cut -d',' -f1 | cut -d' ' -f3)"

  IFS=$'\n' # Set IFS to a line break to split the string into an array
  read -d '' -ra IDS_ARRAY <<<"$IDS"

  for ID in "${IDS_ARRAY[@]}"; do
    pulsemixer --id "$ID" --mute
  done
}

unmute_mic() {
  IDS="$(pulsemixer --list-sources | grep 'Source:' | cut -d',' -f1 | cut -d' ' -f3)"

  IFS=$'\n' # Set IFS to a line break to split the string into an array
  read -d '' -ra IDS_ARRAY <<<"$IDS"

  for ID in "${IDS_ARRAY[@]}"; do
    pulsemixer --id "$ID" --unmute
  done
}

dec_mic() {
  IDS="$(pulsemixer --list-sources | grep 'Source:' | cut -d',' -f1 | cut -d' ' -f3)"

  IFS=$'\n' # Set IFS to a line break to split the string into an array
  read -d '' -ra IDS_ARRAY <<<"$IDS"

  for ID in "${IDS_ARRAY[@]}"; do
    pulsemixer --id "$ID" --max-volume 100 --change-volume -5
  done
}

inc_mic() {
  IDS="$(pulsemixer --list-sources | grep 'Source:' | cut -d',' -f1 | cut -d' ' -f3)"

  IFS=$'\n' # Set IFS to a line break to split the string into an array
  read -d '' -ra IDS_ARRAY <<<"$IDS"

  for ID in "${IDS_ARRAY[@]}"; do
    pulsemixer --id "$ID" --max-volume 100 --change-volume +5
  done
}

# Execute accordingly
if [[ -x $(which pulsemixer) ]]; then
  if [[ "$1" == "--get" ]]; then
    get_volume
  elif [[ "$1" == "--inc" ]]; then
    inc_volume
  elif [[ "$1" == "--dec" ]]; then
    dec_volume
  elif [[ "$1" == "--toggle" ]]; then
    toggle_mute
  elif [[ "$1" == "--toggle-mic" ]]; then
    toggle_mic
  elif [[ "$1" == "--mute-mic" ]]; then
    mute_mic
  elif [[ "$1" == "--unmute-mic" ]]; then
    unmute_mic
  elif [[ "$1" == "--dec-mic" ]]; then
    dec_mic
  elif [[ "$1" == "--inc-mic" ]]; then
    inc_mic
  else
    echo "$(get_volume)"%
  fi
else
  ${notify_cmd} "'pulsemixer' is not installed."
fi
