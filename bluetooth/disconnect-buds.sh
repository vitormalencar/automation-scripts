#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disconnect Buds
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Personal

# Documentation:
# @raycast.description Easy disconnect my galxy buds
# @raycast.author Vitor Alencar
# @raycast.authorURL https://github.com/vitormalencar

# check if bluetoothconnector is installed

# check for evnironment variable $GALAXY_BUDDY_MAC_ADDRESS


which -s bluetoothconnector
if [[ $? != 0 ]] ; then
    echo "bluetoothconnector is not installed"
    echo "Please install bluetoothconnector"
    exit 1
fi

bluetoothconnector -d A0AC691646BB --notify

echo "Disconnected"

