#!/bin/bash

SELECTION="$(printf "[1] Lock\n[2] Suspend\n[3] Log out\n[4] Reboot\n[5] Reboot to UEFI\n[6] Shutdown" | fuzzel --dmenu -l 6 -p "Power Menu: ")"

case $SELECTION in
    *"Lock")
        loginctl lock-session;;
    *"Suspend")
        systemctl suspend;;
    *"Log out")
        niri msg action quit -s;;
    *"Reboot")
        systemctl reboot;;
    *"Reboot to UEFI")
        systemctl reboot --firmware-setup;;
    *"Shutdown")
        systemctl poweroff;;
esac
