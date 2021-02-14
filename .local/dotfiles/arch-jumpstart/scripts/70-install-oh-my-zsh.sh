#!/usr/bin/env sh

main () {
    # prevent zshrc from being overwritten
    KEEP_ZSHRC="yes"
    export KEEP_ZSHRC

    # install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

main

