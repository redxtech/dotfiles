#!/usr/bin/env sh

# run some things before the rest of the startup is run

# set lang environment variables
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"

# initialize thefuck
if command -v thefuck>/dev/null; then
    eval $(thefuck --alias)
fi

