#!/bin/bash
clear
APP='homebrew'
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

echo $'\nPatching PATH...'
echo 'export PATH=$HOME/.homebrew/bin:$PATH' >> ~/.zshrc

echo $'\nSetting AppDir..'
echo 'export HOMEBREW_CASK_OPTS="--appdir=~/Applications"' >> ~/.zshrc

echo $'\nSetting Env...'
echo 'export HOMEBREW_NO_ENV_HINTS=1' >> ~/.zshrc
echo 'setopt autocd' >> ~/.zshrc

echo $'\nInstalling ZSH tools...'
~/.homebrew/bin/brew install pidof npm z zsh-async zsh-autosuggestions zsh-completions zsh-syntax-highlighting

echo "kill $PPID" > ._$APP
osascript -e 'tell application "Terminal" to close first window' & exit
