#!/bin/bash
clear
APP='spaceship'
sleep 1

echo $'\nInstalling Fonts...'
~/.homebrew/bin/brew tap homebrew/cask-fonts
~/.homebrew/bin/brew search font- | grep fira-code | xargs brew install
~/.homebrew/bin/brew search font- | grep jetbrains | xargs brew install

echo $'\nDownloading Spaceship...'
brew install npm && npm install --location=global spaceship-prompt

echo "kill $PPID" > ._$APP
osascript -e 'tell application "Terminal" to close first window' & exit
