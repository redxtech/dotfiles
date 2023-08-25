#!/usr/bin/env sh

#
# sourced by ~/.profile and ~/.zprofile
#

# source path
# shellcheck source=./path.sh
. ~/.config/shell/path.sh

# source environment
# shellcheck source=./env.sh
. ~/.config/shell/env.sh

# if local environment, source it
# shellcheck source=./env.local.sh
test -f ~/.config/shell/env.local.sh && . ~/.config/shell/env.local.sh

# source aliases
# shellcheck source=./aliases.sh
. ~/.config/shell/aliases.sh
