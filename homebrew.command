#!/bin/bash
clear
export APP='homebrew'
sleep 1

test -f ~/.zshrc && rm ~/.zshrc

echo $'\nDownloading Homebrew...'
mkdir -p ~/Applications ~/.homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/.homebrew

echo $'\nStarting homebrew...'
eval "$(.homebrew/bin/brew shellenv)"

echo $'\nUpdating homebrew...'
brew update --force --quiet

echo $'\nChanging permissions...'
chmod -R go-w "$(brew --prefix)/share/zsh"

echo $'\nSetting PATH...'
echo 'export PATH=$HOME/.homebrew/bin:$PATH' >> ~/.zshrc

echo $'\nSetting AppDir..'
echo 'export HOMEBREW_CASK_OPTS="--appdir=~/Applications"' >> ~/.zshrc

echo $'\nSetting Env...'
echo 'export HOMEBREW_NO_ENV_HINTS=1' >> ~/.zshrc

echo $'\nInstalling pidof...'
~/.homebrew/bin/brew install pidof # ~/.homebrew/bin/pidof terminal|xargs kill

echo "kill $PPID" > ._$APP
osascript -e 'tell application "Terminal" to close first window' & exit
