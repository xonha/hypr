#!/usr/bin/env bash

# List of packages to install
packages=(
	catppuccin-gtk-theme-mocha
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
	pipewire
	pipewire-pulse
	xdg-desktop-portal-wlr
	slurp
	stremio
	swaybg
	swaylock
	swappy
	visual-studio-code-bin
	wofi
	wget
	waybar
	noisetorch
	mailspring
	kooha
	xfce-polkit
	wl-clipboard
	python-virtualenv
	vencord-desktop-git
	aur/wdisplays
	aur/hyprpicker
	aur/wl-gammarelay-rs
)

# Install packages using yay with --noconfirm option
yay -Syu --needed --noconfirm "${packages[@]}"

# Apply the Papirus-Dark theme to Papirus-Folders
papirus-folders -C cat-mocha-mauve --theme Papirus-Dark
