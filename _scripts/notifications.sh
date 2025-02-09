#!/bin/bash

if makoctl mode | grep -q "notifications"; then
  echo '{"alt": "active", "class": "active", "tooltip": "Disable Notifications"}' | jq --unbuffered --compact-output
else
  echo '{"alt": "inactive", "class": "inactive", "tooltip": "Enable Notifications"}' | jq --unbuffered --compact-output
fi
