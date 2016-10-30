#!/bin/bash
  
if test ! $(which brew); then
  iStep "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  iGood "Homebrew installed!"
fi
iStep "Updating brew"
brew update
iStep "Upgrading brew packages"
brew upgrade
brew tap Homebrew/bundle
brew bundle

