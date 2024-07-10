#!/usr/bin/env bash

## launch mako with alt config

CONFIG="$HOME/.config/hypr/mako/config.conf"

if [[ ! $(pidof mako) ]]; then
	mako --config "${CONFIG}"
fi
