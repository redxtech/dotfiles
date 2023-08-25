#!/usr/bin/env sh

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
	"$HOME/.config/shell/env.local.sh"

# automatically source files if they exist
for file in "$@"; do
	if test -f "$file"; then
		# shellcheck source=/dev/null
		. "$file"
	fi
done
