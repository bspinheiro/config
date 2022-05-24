#!/bin/bash
mkdir -p ~/Applications ~/.homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/.homebrew
eval "$(.homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
echo "export PATH=$HOME/.homebrew/bin:$PATH" >> ~/.zshrc
echo "export HOMEBREW_CASK_OPTS="--appdir=~/Applications" >> ~/.zshrc
echo "export HOMEBREW_NO_ENV_HINTS=1" >> ~/.zshrc
~/.homebrew/bin/brew install pidof
~/.homebrew/bin/pidof terminal|xargs kill
