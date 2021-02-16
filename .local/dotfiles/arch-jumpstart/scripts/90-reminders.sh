#!/usr/bin/env sh

language_versions () {
    NODEJS_V="$(node -v | sed 's/v//g')"
    PYTHON_V="$(python -V | awk '{print $2}')"
    JAVA_V="$(java --version | head -1 | awk '{print $2 " (" $1 ")"}')"

    echo ""
    echo "Language Versions:"
    echo ""
    echo "NodeJS Version: $NODEJS_V"
    echo "Python Version: $PYTHON_V"
    echo "Java Version: $JAVA_V"
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

    echo "- Test zsh install"
    echo "- Add list of rclone configs"
    echo "- Add local computers to /etc/hosts"
    echo "- Fix zsh plugin choosing"

    language_versions
}

main

