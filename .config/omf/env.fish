set -xg fish_user_paths
set -xg EDITOR /usr/bin/nvim
set -xg FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# init nvm
if test -n "(nvm)"
  nvm use default
end

