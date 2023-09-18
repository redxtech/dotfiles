#!/usr/bin/env zsh

# function to test if one variables contains another
contains() {
	for WORD in $(echo "$2" | sed -E 's/:/ /g'); do
		if test "$WORD" = "$1"; then
			return 0
		fi
	done

	return 1
}

# make "array" of directories to add to path
set -- \
	"$HOME/.local/bin" \
	"$HOME/.nix-profile/bin" \
	"$HOME/.config/yarn/global/node_modules/.bin" \
	"$HOME/.deno/bin" \
	"$HOME/.cargo/bin" \
	"$HOME/.config/rofi/scripts" \
	"$HOME/.local/share/pnpm" \
	"$HOME/.local/share/gem/ruby/3.0.0/bin" \
	"/snap/bin"

# automatically add folder to PATH, if it exists and isn't already in PATH
for bin_path in "$@"; do
	if test -d "$bin_path" && ! contains "$bin_path" "$PATH"; then
		PATH="$PATH:$bin_path"
	fi
done

export PATH

