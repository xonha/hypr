#!/usr/bin/env bash

## Autostart Programs

# Kill already running process
_ps=(waybar mako mpd xfce-polkit)
for _prs in "${_ps[@]}"; do
  if [[ `pidof ${_prs}` ]]; then
    killall -9 ${_prs}
  fi
done

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Set wallpaper
swaybg --output '*' --mode fill --image ~/.config/hypr/wallpapers/wallpaper.jpg &

# Apply themes
~/.config/hypr/.scripts/gtkthemes.sh &

# Lauch notification daemon (mako)
~/.config/hypr/.scripts/notifications.sh &

# Lauch statusbar (waybar)
~/.config/hypr/.scripts/statusbar.sh &

# Start network manager applet
nm-applet --indicator &

# Configure swappy
cp ~/.config/hypr/swappy/config ~/.config/swappy &