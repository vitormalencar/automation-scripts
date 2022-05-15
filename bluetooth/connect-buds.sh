#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Connect Buds
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Personal

# Documentation:
# @raycast.description Easy connecy to my galaxy buds
# @raycast.author Vitor Alencar
# @raycast.authorURL https://github.com/vitormalencar


which -s bluetoothconnector
if [[ $? != 0 ]] ; then
    echo "bluetoothconnector is not installed"
    echo "Please install bluetoothconnector"
    exit 1
fi

bluetoothconnector -c A0AC691646BB

echo "Connected!"
