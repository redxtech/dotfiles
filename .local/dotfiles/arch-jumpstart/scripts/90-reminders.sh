#!/usr/bin/env sh

main () {
    echo ""
    echo "Some general reminders:"
    echo "- Download id_rsa{,.pub} and save to ~/.ssh (700), with perms 600 and 644 (pub)."
    echo "- Add rclone configs"

    echo ""
    echo "Some TODO reminders:"
    echo ""

    echo "- Automate zsh install" # pre-yadm clone
    echo "- Install yarn" # post package install
    echo "- Passwordless sudo"
    echo "- Install neovim python, nodejs"
    echo "- Add python-pynvim to packages"
    echo "- Add rebuild python modules script"
    echo "- Switch yadm remove to ssh version"
    echo "- Add list of rclone configs"
}

main

