#!/usr/bin/env bash
#
# Author: Zachary Newell
# Date: July 2026
# Version: 1.0.0
#
# Description:
# Updates Arch Linux packages and performs basic system cleanup.
#
set -e

echo "Starting system update..."

sudo pacman -Syu --noconfirm

echo "Removing orphaned packages..."

orphans=$(pacman -Qtdq)

if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
else
    echo "No orphaned packages found."
fi

echo "Cleaning temporary files..."

sudo systemd-tmpfiles --clean

echo "System maintenance complete!"
