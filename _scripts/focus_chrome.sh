#!/bin/bash

# Check if application name is provided
if [ -z "$1" ]; then
  echo "No application name provided"
  exit 1
fi

# Get the application name
APP_NAME=$1

# Check if focus name is provided
if [ -z "$2" ]; then
  # If not provided, use application name for focus
  APP_FOCUS_NAME=$APP_NAME
else
  # If provided, use it for focus
  APP_FOCUS_NAME=$2
fi

# Execute the command
wlrctl toplevel focus app_id:Google-chrome title:"$APP_FOCUS_NAME" || hyprctl dispatch exec "$APP_NAME"
