#!/usr/bin/env bash

# List of packages to install
packages=(
	debugedit
	catppuccin-gtk-theme-mocha
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
	stremio
	swaybg
	ttf-jetbrains-mono-nerd
	swaylock
	swappy
	visual-studio-code-bin
	wofi
	wget
	waybar
	noisetorch
	lazygit
	mailspring
	kooha
	xfce-polkit
	wl-clipboard
	python-virtualenv
	vencord-desktop-git
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
	aur/wdisplays
	aur/hyprpicker
	aur/wl-gammarelay-rs
	aur/todoist-nativefier
	aur/wlrctl
	aur/youtube-music-next-bin
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
