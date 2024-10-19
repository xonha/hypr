#!/usr/bin/env bash

PKG_INSTALL=(
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
)

PKG_AUR_INSTALL=(
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

PKG_UNINSTALL=(
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
  firefox
  network-manager-applet
  networkmanager-dmenu-git
  thunar-volman
  thunar-media-tags-plugin
  thunar-archive-plugin
  thunar
)

echo "Installing keyring..."
sudo pacman -Sy archlinux-keyring

echo "Installing packages..."
yay -Syu --needed --noconfirm --removemake "${PKG_INSTALL[@]}"

echo "Installing AUR packages..."
yay -Syu --needed --noconfirm --removemake "${PKG_AUR_INSTALL[@]}"

echo "Setting up papirus-folders..."
papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
echo "Done."

echo "Setting up user input permissions..."
sudo usermod -a -G input "$USER"

echo "Uninstalling packages one by one..."
for package in "${PKG_UNINSTALL[@]}"; do
  yay -Rns "$package" --noconfirm
done

echo "Done."
