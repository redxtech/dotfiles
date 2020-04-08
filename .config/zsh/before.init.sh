#!/usr/bin/env sh

# run some things before the rest of the startup is run

# set lang environment variables
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"

# start SHH agent
# if test -n "$(pgrep -u "$USER" ssh-agent)"; then
  # ssh-agent > /dev/null
# fi

# set environment variables for the SSH agent
# if test -z "$SSH_AGENT_PID"; then
    # eval "$(ssh-agent -s)" > /dev/null
# fi

# export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# add ssh keys
# if test -e "$HOME/.local/bin/scripts/add-ssh-identities"; then
    # "$HOME/.local/bin/scripts/add-ssh-identities"
# fi

# initialize thefuck
if command -v thefuck>/dev/null; then
    eval $(thefuck --alias)
fi

