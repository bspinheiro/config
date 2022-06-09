#!/bin/bash
clear
APP='template'
sleep 1

echo $'\nDownloading Template...'
# CMD here

echo "kill $PPID" > ._$APP
osascript -e 'tell application "Terminal" to close first window' & exit
