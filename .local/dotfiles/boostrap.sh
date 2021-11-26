#!/usr/bin/env sh

# Run this script with:
# sh <(curl -Ls dot.gabedunn.dev)

echo "Starting bootstrap script..."

sudo pacman -S \
  git \
  htop \
  keychain \
  neovim \
  nodejs \
  npm \
  python \
  vim \
  xclip \
  yarn \
  zsh

# generate new ssh key
ssh-keygen -t ed25519 -C "gabe@sent.at"
eval $(keychain --eval id_ed25519)

# copy ssh public key
cat ~/.ssh/*.pub | xclip -selection c
echo "SSH key copied to clipboard!"

# wait to add keychain to github
# shellcheck disable=SC2162
read "Add your ssh key to github, then press enter to continue" </dev/tty

# pull in yadm for dotfiles
sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
sudo chmod a+x /usr/local/bin/yadm

# clone in the dotfiles
/usr/local/bin/yadm clone git@github.com:redxtech/dotfiles.git

# set user shell to zsh
chsh -s "$(which zsh)"

echo

# remove the yadm binary
echo Remember to remove the yadm binary with:
echo sudo rm /usr/local/bin/yadm

