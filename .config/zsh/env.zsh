#!/usr/bin/env zsh

# run zoxide setup
if command -v zoxide>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# run fnm
# if command -v fnm>/dev/null; then
#     eval "$(fnm env --use-on-cd)"
# fi
