#!/usr/bin/env sh

# startup shell profile

# source startup files
# shellcheck source=.config/zsh/before.init.sh
[ -f "$ZSH_CUSTOM/before.init.sh" ] && . "$ZSH_CUSTOM/before.init.sh"
# shellcheck source=.config/zsh/init.sh
[ -f "$ZSH_CUSTOM/init.sh" ] && . "$ZSH_CUSTOM/init.sh"

