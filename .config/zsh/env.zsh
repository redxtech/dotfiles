#!/usr/bin/env zsh

#
# environment variables
#

# basic environment
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="vivaldi-stable"

# program specific
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BAT_THEME=Dracula
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export PNPM_HOME="$HOME/.local/share/pnpm"
export KUBECONFIG="$HOME/.config/kube/config"

# make "array" of files to source
set -- \
	"$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" \
	"$HOME/.config/zsh/env.local.zsh"

# automatically source files if they exist
for file in "$@"; do
	if test -f "$file"; then
		# shellcheck source=/dev/null
		. "$file"
	fi
done

#
# zsh plugin setup
#

# run zoxide setup
if command -v zoxide>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# run fnm
if command -v fnm>/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# run mcfly
if command -v mcfly>/dev/null; then
    eval "$(mcfly init zsh)"
fi
