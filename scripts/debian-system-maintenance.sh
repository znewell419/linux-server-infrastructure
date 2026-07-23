#!/usr/bin/env bash
#
# Author: Zachary Newell
# Date: November 2025
# Version: 1.1.0
#
# Description:
# Updates Debian/Ubuntu systems and performs basic system cleanup.
#
# Changes:
# 1.1.0 - Improved error handling
#       - Added sudo support
#       - Replaced manual /tmp deletion with systemd cleanup
#       - Added clearer output messages

set -e

echo "Starting system update..."

sudo apt-get update
sudo apt-get upgrade -y

echo "Removing unnecessary packages..."

sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "Cleaning temporary files..."

sudo systemd-tmpfiles --clean

echo "System maintenance complete!"
