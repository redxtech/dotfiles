#!/usr/bin/env sh

YARN_PATH="$HOME/.config/yarn/global/node_modules/.bin"
CARGO_PATH="$HOME/.cargo/bin"
SCRIPTS_PATH="$HOME/Documents/scripts/bin"
LOCAL_BIN_PATH="$HOME/.local/bin"

# function to test if one variables contains another
contains () {
    for WORD in $(echo "$2" | sed -E 's/:/ /g'); do
        if test "$WORD" = "$1"; then
            return 0
        fi
    done

    return 1
}

if test -d "$YARN_PATH" && ! contains "$YARN_PATH" "$PATH"; then
    export PATH="$PATH:$YARN_PATH"
fi

if test -d "$CARGO_PATH" && ! contains "$CARGO_PATH" "$PATH"; then
    export PATH="$PATH:$CARGO_PATH"
fi

if test -d "$SCRIPTS_PATH" && ! contains "$SCRIPTS_PATH" "$PATH"; then
    export PATH="$PATH:$SCRIPTS_PATH"
fi

if test -d "$LOCAL_BIN_PATH" && ! contains "$LOCAL_BIN_PATH" "$PATH"; then
    PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
    export PATH="$PATH:$LOCAL_BIN_PATH"
fi

