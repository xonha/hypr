#!/usr/bin/env bash

# List of packages to install
packages=(
  debugedit
  catppuccin-gtk-theme-mocha
  github-cli
  grim
  guake
  hyprland
  kitty
  light
  lxappearance
  mpv
  neovim
  npm
  nemo
  nemo-audio-tab
  nemo-fileroller
  nemo-preview
  nemo-python
  papirus-folders-catppuccin-git
  qalculate-gtk
  pipewire
  pipewire-pulse
  ripgrep
  xdg-desktop-portal-wlr
  slurp
  hyprpaper
  hyprlock
  ttf-jetbrains-mono-nerd
  swappy
  docker
  wofi
  wget
  waybar
  noisetorch-bin
  lazygit
  hyprpicker
  kooha
  xfce-polkit
  wl-clipboard
  python-virtualenv
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  aur/stremio
  aur/keeweb-desktop-bin
  aur/visual-studio-code-bin
  aur/mailspring-bin
  aur/google-chrome
  aur/vesktop-bin
  aur/wdisplays
  aur/wl-gammarelay-rs
  aur/todoist-nativefier
  aur/valent-git
  aur/wlrctl
  aur/youtube-music-bin
  aur/lazydocker-bin
)

echo "Installing packages..."
yay -Syu --needed --noconfirm --removemake "${packages[@]}"
echo "Done."

echo "Setting up papirus-folders..."
papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
echo "Done."

echo "Setting up user input permissions..."
sudo usermod -a -G input "$USER"
echo "Done."
