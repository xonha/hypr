#!/bin/bash

# Function to toggle between two output sinks
toggle_audio_output() {
  # Get the current default sink
  current_sink=$(pactl get-default-sink)

  # Define your two sinks
  sink1="alsa_output.pci-0000_05_00.1.hdmi-stereo"
  sink2="alsa_output.usb-GeneralPlus_USB_Audio_Device-00.iec958-stereo"

  # Check which sink is currently active and switch to the other
  if [ "$current_sink" == "$sink1" ]; then
    pactl set-default-sink "$sink2"
    for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
      pactl move-sink-input "$stream" "$sink2"
    done
    echo "Switched to USB Audio Device"
  else
    pactl set-default-sink "$sink1"
    for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
      pactl move-sink-input "$stream" "$sink1"
    done
    echo "Switched to HDMI Audio Device"
  fi
}

# Call the function
toggle_audio_output
