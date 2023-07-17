#!/usr/bin/env zsh

# init script

if test -e "$HOME/.config/zsh/env.zsh"; then
    # shellcheck source=env.zsh
  . "$HOME/.config/zsh/env.zsh"
fi

if test -e "$HOME/.config/zsh/path.zsh"; then
    # shellcheck source=path.zsh
  . "$HOME/.config/zsh/path.zsh"
fi

if test -e "$HOME/.config/zsh/aliases.zsh"; then
    # shellcheck source=aliases.zsh
  . "$HOME/.config/zsh/aliases.zsh"
fi

