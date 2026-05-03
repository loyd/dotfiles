#!/bin/env bash

CFG=/home/code/fave/dotfiles

ln -s $CFG/.zshrc ~/.zshrc
mkdir -p ~/.config/oh-my-zsh
ln -s $CFG/oh-my-zsh/themes ~/.config/oh-my-zsh

ln -s $CFG/nvim ~/.config
ln -s $CFG/alacritty ~/.config
ln -s $CFG/kitty ~/.config
ln -s $CFG/niri ~/.config
ln -s $CFG/waybar ~/.config
ln -s $CFG/fuzzel ~/.config
ln -s $CFG/mako ~/.config
ln -s $CFG/hypr ~/.config
ln -s $CFG/fence ~/.config
