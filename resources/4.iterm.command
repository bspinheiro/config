#!/bin/bash
clear
APP='iterm'
sleep 1

echo $'\nDownloading iTerm2...'
brew install iterm2

echo "kill $PPID" > ._$APP
osascript -e 'tell application "Terminal" to close first window' & exit
