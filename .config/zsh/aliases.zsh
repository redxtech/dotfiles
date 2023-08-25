#!/usr/bin/env zsh

# swallow windows for certain apps
if command -v devour >/dev/null; then
  local swallowed=(feh mpv sxiv)

  for app in $swallowed; do
		if command -v $app >/dev/null; then
			alias $app="devour $app"
		fi
  done
fi

## abbreviations

# default to session and quiet
if command -v abbr >/dev/null; then
  alias abbr="abbr -S --quiet"
else
  alias abbr="alias"
fi

# i often spell yadm as yamd
abbr yamd="yadm"
abbr yand="yadm"

# my common misspellings
abbr ecoh="echo"
abbr pacuar="pacaur"
abbr sudp="sudo"
abbr yarm="yarn"
abbr clera="clear"
abbr claer="clear"
alias dc="cd"

