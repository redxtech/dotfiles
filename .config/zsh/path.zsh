#!/usr/bin/env zsh

# function to test if one variables contains another
contains () {
	for WORD in $(echo "$2" | sed -E 's/:/ /g'); do
		if test "$WORD" = "$1"; then
			return 0
		fi
	done
	return 1
}

# list of directories to add to path
local paths_to_add=(
	"$HOME/.config/yarn/global/node_modules/.bin"
	"$HOME/.local/share/gem/ruby/3.0.0/bin"
	"$HOME/.deno/bin"
	"$HOME/.cargo/bin"
	"$HOME/.local/share/pnpm"
	"$HOME/.local/bin"
	"$HOME/.config/rofi/scripts"
	"/snap/bin"
)

# loop through the dirs and add them to the path
for bin_path in $paths_to_add; do
	# check that the directory exists and that it isn't already in PATH
	if test -d "$bin_path" && ! contains "$bin_path" "$PATH"; then
		export PATH="$PATH:$bin_path"
	fi

	# handle subdirectories of the .local/bin path
	if test "$bin_path" = "$HOME/.local/bin"; then
		export PATH="$PATH:$(du "$bin_path" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
	fi
done

