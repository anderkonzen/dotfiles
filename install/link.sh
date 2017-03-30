#!/bin/bash

DOTFILES=$HOME/.dotfiles

newLine
iHeader "Creating symlinks..."

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/$( basename $file '.symlink' )"
    iStep "Handling file $target"
    if [ -L $target ]; then
        iBad "~${target#$HOME} already exists... Skipping."
    else
        ln -s $file $target && iGood "Symlink created $target"
    fi
done

iFinishStep "Symlinks created!"

newLine
iHeader "Creating custom symlinks..."

target="$HOME/bin/elm-format"

iStep "Handling file $target"
if [ -L $target ]; then
  iBad "~${target#$HOME} already exists... Skipping."
else
  ln -s $(which elm-format-0.18) $target && iGood "Symlink created $target"
fi

iFinishStep "Custom symlinks created!"

newLine
iHeader "Installing to ~/.config..."

if [ ! -d $HOME/.config ]; then
    iStep "Creating ~/.config"
    mkdir -p $HOME/.config && iGood "~/.config created"
fi
for config in $DOTFILES/.config/*; do
    target=$HOME/.config/$( basename $config )
    iStep "Handling config $target"
    if [ -L $target ]; then
        iBad "~${target#$HOME} already exists... Skipping."
    else
        ln -s $config $target && iGood "Symlink created $target"
    fi
done

iFinishStep "~./config installed!"

