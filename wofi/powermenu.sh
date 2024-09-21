#!/usr/bin/env bash

## Wofi Powermenu

## Files
CONFIG="$HOME/.config/hypr/wofi/config.conf"
STYLE="$HOME/.config/hypr/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

## Wofi Command
wofi_command="wofi --show dmenu \
--conf ${CONFIG} --style ${STYLE} --color ${COLORS} \
--width=100 --height=188 \
--cache-file=/dev/null \
--hide-scroll --no-actions \
--define=matching=fuzzy"

uptime=$(uptime -p | sed -e 's/up //g')

## Entries
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
logout=" Logout"

# Ask for confirmation
cdialog() {
  yad --title='Confirm?' --borders=15 --center --fixed --undecorated --button=Yes:0 --button=No:1 --text="Are you sure?" --text-align=center
}

# Variable passed to rofi
open_menu() {
  options="$lock\n$logout\n$reboot\n$shutdown"

  chosen="$(echo -e "$options" | $wofi_command --prompt "UP - $uptime")"
  case $chosen in
  $shutdown)
    cdialog
    if [[ "$?" == 0 ]]; then
      systemctl poweroff
    else
      exit
    fi
    ;;
  $reboot)
    cdialog
    if [[ "$?" == 0 ]]; then
      systemctl reboot
    else
      exit
    fi
    ;;
  $lock)
    hyprlock --config ~/.config/hypr/lockscreen/hyprlock.conf
    ;;
  $logout)
    cdialog
    if [[ "$?" == 0 ]]; then
      hyprctl dispatch exit 0
    else
      exit
    fi
    ;;
  esac
}

if [[ ! $(pidof wofi) ]]; then
  open_menu
else
  pkill wofi
fi
