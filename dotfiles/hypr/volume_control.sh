#!/bin/bash

case $1 in
    "increase")
        xdotool key XF86AudioRaiseVolume
        ;;
    "decrease")
        xdotool key XF86AudioLowerVolume
        ;;
    "mute")
        xdotool key XF86AudioMute
        ;;
    *)
        echo "Usage: $0 {increase|decrease|mute}"
        exit 1
        ;;
esac

