#!/usr/bin/env sh

# Run this script with:
# sh <(curl -Ls dot.gabedunn.dev)

echo "Starting bootstrap script..."

sudo pacman -S \
  git \
  htop \
  neovim \
  vim \
  zsh

# pull in yadm for dotfiles
sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
sudo chmod a+x /usr/local/bin/yadm

# clone in the dotfiles
/usr/local/bin/yadm clone git@github.com:redxtech/dotfiles.git

# remove the yadm binary
sudo rm /usr/local/bin/yadm

