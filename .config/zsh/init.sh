#!/usr/bin/env sh

# init script

if test -e "$HOME/.config/zsh/env.sh"; then
    # shellcheck source=env.sh
  . "$HOME/.config/zsh/env.sh"
fi

if test -e "$HOME/.config/zsh/path.sh"; then
    # shellcheck source=path.sh
  . "$HOME/.config/zsh/path.sh"
fi

if test -e "$HOME/.config/zsh/aliases.sh"; then
    # shellcheck source=aliases.sh
  . "$HOME/.config/zsh/aliases.sh"
fi

if test -e "$HOME/.asdf/asdf.sh"; then
    # shellcheck disable=SC1090
  . "$HOME/.asdf/asdf.sh"
fi

# init thefuck
eval "$(thefuck --alias)"

