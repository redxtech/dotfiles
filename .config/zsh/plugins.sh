#!/usr/bin/env zsh

# try to clone the plugin
function try_install () {
    PLUGIN_URL="https://github.com/$1.git"
    PLUGIN_BASE_DIR="$(sed 's/.*\///' <<< $1)"

    if ! test -d "$ZSH_CUSTOM/plugins/$PLUGIN_BASE_DIR"; then
        git clone "$PLUGIN_URL" "$ZSH_CUSTOM/plugins/$PLUGIN_BASE_DIR"
        echo "cloned $PLUGIN_BASE_DIR"
    fi
}

# install oh-my-zsh plugins
function main () {
    # zsh completions
    try_install zsh-users/zsh-completions
    # zsh autosuggestions
    try_install zsh-users/zsh-autosuggestions
    # zsh syntax highlighting
    try_install zsh-users/zsh-syntax-highlighting
}

main

