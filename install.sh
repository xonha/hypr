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
	aur/wdisplays
	aur/hyprpicker
	aur/wl-gammarelay-rs
	aur/wlrctl
	aur/youtube-music-next-bin
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Install packages using yay with --noconfirm option
yay -Syu --needed --noconfirm "${packages[@]}"

# Apply the Papirus-Dark theme to Papirus-Folders
papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
