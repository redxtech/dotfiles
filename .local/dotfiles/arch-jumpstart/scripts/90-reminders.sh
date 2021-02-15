#!/usr/bin/env sh

language_versions () {
    echo ""
    echo "Language Versions:"
    echo ""
    echo "NodeJS Version: $(node -v)"
    echo "Python Version: $(python --version)"
    echo "Python 2 Version: $(python2 --version)"
    echo "Java Version: $(java --version | head -1)"
}

main () {
    echo ""
    echo "Some general reminders:"
    echo "- Download id_rsa{,.pub} and save to ~/.ssh (700), with perms 600 and 644 (pub)."
    echo "- Add rclone configs"
    echo "- Run build-coc"

    echo ""
    echo "Some TODO reminders:"
    echo ""

    echo "- Eventually convert config check to auto edit with sed"
    echo "- Test zsh install"
    echo "- Add rebuild python modules script"
    echo "- Switch yadm remove to ssh version"
    echo "- Add list of rclone configs"
    echo "- Add local computers to /etc/hosts"
    echo "- Switch to 1.1.1.1 DNS"
    echo "- Display versions of installed languages"

    language_versions
}

main

