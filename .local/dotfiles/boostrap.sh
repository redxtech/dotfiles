#!/usr/bin/env sh

# Run this script with:
# sh <(curl -Ls dot.gabedunn.dev)

echo "Starting bootstrap script..."

sudo pacman -S \
  git \
  htop \
  keychain \
  neovim \
  vim \
  zsh

# generate new ssh key
ssh-keygen -t ed25519 -C "gabe@sent.at"
eval $(keychain --eval id_ed25519)

# pull in yadm for dotfiles
sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
sudo chmod a+x /usr/local/bin/yadm

# clone in the dotfiles
/usr/local/bin/yadm clone git@github.com:redxtech/dotfiles.git

# remove the yadm binary
sudo rm /usr/local/bin/yadm

