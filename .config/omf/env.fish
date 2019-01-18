set -xg fish_user_paths
set -xg EDITOR /usr/bin/nvim

# init nvm
if test -n "(nvm)"
  nvm use default
end

# init kitty
if test -n "(kitty)"
  kitty + complete setup fish | source
end
