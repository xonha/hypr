#!/usr/bin/env bash

# List of packages to install
packages=(
    catppuccin-gtk-theme-mocha
    discord
    fish
    github-cli
    google-chrome
    grim
    guake
    hyprland
    keeweb-desktop-bin
    kitty
    light
    lxappearance
    mako
    mpv
    nemo
    nemo-audio-tab
    nemo-fileroller
    nemo-preview
    nemo-python
    neovim
    papirus-folders-catppuccin-git
    qalculate-gtk
    slurp
    stremio
    swaybg
    swaylock
    swappy
    visual-studio-code-bin
    wofi
    wget
    waybar
    xfce-polkit
    python-virtualenv
    python38
    python39
    python310
)

# Install packages using yay with --noconfirm option
yay -S --noconfirm "${packages[@]}"

# Apply the Papirus-Dark theme to Papirus-Folders
papirus-folders -C cat-mocha-peach --theme Papirus-Dark

# Install Discord Screenshare Linux script
bash -c "$(curl https://raw.githubusercontent.com/fuwwy/Discord-Screenshare-Linux/main/scripts/install.sh -sSfL)"
