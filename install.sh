#!/usr/bin/env bash

sudo pacman -S \
hyprland \
grim \
slurp \
swappy \
swaylock \
swaybg \
wofi \
mako \
neovim \
waybar \
lxappearance \
nemo \
nemo-python \
nemo-preview \
nemo-fileroller \
nemo-audio-tab \
light \
xfce-polkit \
discord \
qalculate-gtk \
guake \
kitty \
fish \
wget \
catppuccin-gtk-theme-mocha \
papirus-folders-catppuccin-git \
&& papirus-folders -C cat-mocha-peach --theme Papirus-Dark \
&& bash -c "$(curl https://raw.githubusercontent.com/fuwwy/Discord-Screenshare-Linux/main/scripts/install.sh -sSfL)" \