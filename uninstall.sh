#!/bin/bash

# List of packages to uninstall
packages=(
    archcraft-neofetch
    archcraft-omz
    archcraft-hooks-zsh
    archcraft-ranger
    archcraft-help
    archcraft-about
    archcraft-vim
    archcraft-openbox
    xfce4-power-manager
    xfce4-notifyd
    xfce4-settings
    xfce4-terminal
    obmenu-generator
    obconf
    openbox
    plank
    rofi
    xcolor
    alacritty
    ranger
    tint2
    mplayer
    mpd
    vim
    simplescreenrecorder
    picom
    meld
    arandr
    xarchiver
    nitrogen
    galculator
    atril
    zsh
)

# Loop through the packages and uninstall them one by one
for package in "${packages[@]}"; do
    yay -Rns "$package" --noconfirm
done