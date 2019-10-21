# basic env
set -xg TERMINAL /usr/bin/alacritty
set -xg EDITOR /usr/bin/nvim
set -xg BROWSER /usr/bin/vivaldi-snapshot

# program specific
set -xg fish_user_paths
set -xg FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -xg RANGER_LOAD_DEFAULT_RC FALSE

