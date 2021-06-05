#!/usr/bin/env zsh

# zsh plugin to clone a package from the AUR and install it with makepkg

# add the functions to the function path & autoload them
fpath+=("$(dirname ${0})/functions")
autoload -Uz aur-install

