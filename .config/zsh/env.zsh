#!/usr/bin/env zsh

# basic environment
EDITOR="nvim"
VISUAL="nvim"
TERMINAL="$(command -v kitty)"
BROWSER="$(command -v vivaldi-stable)"

# if nvim is installed switch the variable to that
if command -v nvim>/dev/null; then
    EDITOR="$(command -v nvim)"
fi

# export the variables
export EDITOR
export TERMINAL
export BROWSER

# program specific
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BAT_THEME=Dracula
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export PNPM_HOME="$HOME/.local/share/pnpm"

# automatically source files if they exist
local files_to_source=(
  "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
  "$HOME/.config/zsh/env.local.zsh"
)

# loop through the files and source them
for file in $files_to_source; do
	if test -f "$file"; then
    source "$file"
	fi
done

# kubectl
export KUBECONFIG="$HOME/.config/kube/config"
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# run zoxide setup
if command -v zoxide>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# run fnm
# if command -v fnm>/dev/null; then
#     eval "$(fnm env --use-on-cd)"
# fi
