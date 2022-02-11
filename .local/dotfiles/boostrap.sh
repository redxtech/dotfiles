#!/usr/bin/env sh

# Run this script with:
# sh <(curl -Ls dot.gabedunn.dev)

echo "Starting bootstrap script..."

# install the required packages
echo "Installing required packages..."
sudo pacman -S \
  git \
  htop \
  hub \
  keychain \
  neovim \
  nodejs \
  npm \
  python \
  vim \
  xclip \
  yadm \
  yarn \
  zsh

# generate new ssh key
echo "Generating new ssh key..."
ssh-keygen -t ed25519 -C "gabe@sent.at"
eval $(keychain --eval id_ed25519)

# copy ssh public key
cat ~/.ssh/*.pub | xclip -selection c
echo "SSH key copied to clipboard!"

# wait to add keychain to github
echo "Add your ssh key to github, then press enter to continue"
read

# clone in the dotfiles
echo "Cloning dotfiles repo..."
yadm clone git@github.com:redxtech/dotfiles.git

# set user shell to zsh
echo "Setting default shell to zsh..."
chsh -s "$(which zsh)"

echo

echo "Bootstrap script has finished running!"
echo "Let zsh initialize, then use load-module to complete the setup!"

