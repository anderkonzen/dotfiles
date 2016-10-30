#!/bin/bash

# Detect OS
OS="$(uname -s)"

function iHeader()     { echo -e "\033[1m$@\033[0m";  }
function iStep()       { echo -e "  \033[1;33m➜\033[0m $@"; }
function iFinishStep() { echo -e "  \033[1;32m✔\033[0m $@"; }
function iGood()       { echo -e "    \033[1;32m✔\033[0m $@"; }
function iBad()        { echo -e "    \033[1;31m✖\033[0m $@"; }
function newLine()     { echo -e "\n"; }

iHeader "Initializing submodule(s)..."
git submodule update --init --recursive
iFinishStep "Submodules initialized!"

source install/link.sh

if [[ "$OS" =~ ^Darwin ]]; then
  newLine 
  iHeader "Running OSX Setup..."

  source install/brew.sh

  iStep "Configuring macOS" 
  source install/macos.sh
  
  iFinishStep "OSX installation complete!"
fi

newLine
iHeader "Configuring zsh as default shell..."

zshPath=$(which zsh)
if ! grep "$zshPath" < /etc/shells &> /dev/null; then
  command -v $zshPath | sudo tee -a /etc/shells
fi
sudo chsh -s "$zshPath" &> /dev/null

iFinishStep "zsh configured!"

newLine
iFinishStep "Installation complete!"
unset iHeader iStep iGood iBad iFinishStep newLine


