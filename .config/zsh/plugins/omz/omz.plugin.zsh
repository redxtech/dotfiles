#!/usr/bin/env zsh

# a zsh shell script to manage plugins for oh-my-zsh

# some initial variables
local DEFAULT_PLUGIN_URL="${DEFAULT_PLUGIN_URL:-"https://github.com"}"
local PLUGIN_BASE_DIR="${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}/plugins/"

# help command
function usage () {
    cat << 'eof'
Usage: omz [-h/--help] <command> [<plugin>]

Commands:
    help:       show this help message
    add:        add a plugin (git clone)
    update:     update a plugin (update all if no plugins are specified)
    remove:     remove a plugin

Options:
    -h, --help  show this help message
eof
}

# function to check if git is installed
function has_git () {
    command -v git >/dev/null
}

# error logging function
function log_err () {
    echo "error: $*"
}

# cd to directory, run a command, and cd back
function run_in_dir () {
    # make sure at least two arguments were passed
    if test -z "$1"; then
        log_err "you need to specify a directory"
        return 1
    elif test -z "$2"; then
        log_err "you need to specify a command"
        return 1
    fi
    
    # make sure the destination directory and command exist
    if ! test -d "$1"; then
        log_err "that isn't a directory"
        return 1
    fi

    if ! command -v "$2" >/dev/null; then
        log_err "that isn't a valid command"
        return 1
    fi

    # save the current directory to cd back to
    local CURRENT_DIR="$(pwd)"

    # cd into the destination
    cd "$1"

    # run the command
    "$@[2,-1]"

    # save the return status
    local RETURN_CODE="$?"

    # change back to the original directory
    cd "$CURRENT_DIR"

    return "$RETURN_CODE"
}

# create github url
function create_gh_url () {
    echo "$DEFAULT_PLUGIN_URL/$1.git"
}

# get plugin name
function get_plugin_name () {
    echo "$(sed 's/.*\///' <<< "$1")"
}

# check if a git repo exists
function repo_exists () {
    # if there wasn't a param passed return 1
    if test -z "$1"; then
        return 1
    fi

    # save the url
    local REPO_URL="$(create_gh_url "$1")"

    # save the status
    local STATUS_CODE="$(curl -s -o /dev/null -w "%{http_code}" -L "$1")"
    
    # if the status is not 200, return 1
    if test "$STATUS_CODE" -eq 200; then
        return 0
    else
        return 1
    fi
}

# clone a plugin
function clone_plugin () {
    # gather some info on the plugin
    local REPO_URL="$(create_gh_url "$1")"
    local PLUGIN_NAME="$(get_plugin_name "$1")"
    local PLUGIN_DIR="$PLUGIN_BASE_DIR/$PLUGIN_NAME"

    # if the directory exists, do nothing
    if test -d "$PLUGIN_DIR"; then
        log_err "you already have that plugin"
        return 1
    fi

    # make sure the repo exists
    # if ! repo_exists; then;
    #     log_err "that repo doesn't exist"
    #     return 1
    # fi

    echo "Cloning $PLUGIN_NAME ($REPO_URL)..."

    # clone the plugin
    run_in_dir "$PLUGIN_BASE_DIR" git clone "$REPO_URL"

    echo "$PLUGIN_NAME cloned!"

    return "$?"
}

# update a plugin
function update_plugin () {
    # gather some info on the plugin
    local PLUGIN_NAME="$(get_plugin_name "$1")"
    local PLUGIN_DIR="$PLUGIN_BASE_DIR/$PLUGIN_NAME"

    # if the directory doesn't exist, throw an error
    if ! test -d "$PLUGIN_DIR"; then
        log_err "you can't update something you don't have"
        return 1
    fi

    echo "Updating $PLUGIN_NAME ($PLUGIN_DIR)..."

    # pull the plugin
    run_in_dir "$PLUGIN_DIR" git pull
    
    echo "Updated $PLUGIN_NAME!"

    return "$?"
}

# update all plugins
function update_all () {
    # for each folder in the plugin directory, if it's a git repo pull it
    for PLUGIN_DIR in "$PLUGIN_BASE_DIR/"*/; do
        # check for git folder
        if test -d "$PLUGIN_DIR/.git"; then
            echo "Updating $PLUGIN_DIR..."
            
            # pull the plugin
            run_in_dir "$PLUGIN_DIR" "git pull"
            
            echo "Updated $PLUGIN_DIR!"
        fi
    done
}

# remove a plugin
function remove_plugin () {
    # gather some info on the plugin
    local PLUGIN_NAME="$(get_plugin_name "$1")"
    local PLUGIN_DIR="$PLUGIN_BASE_DIR/$PLUGIN_NAME"

    echo "Removing $PLUGIN_NAME ($PLUGIN_DIR)..."

    # if the directory exists, remove it
    if test -d "$PLUGIN_DIR"; then
        rm -rf "$PLUGIN_DIR"
        echo "Removed $PLUGIN_NAME!"
        return "$?"
    else
        log_err "you can't remove something you don't have"
        return 1
    fi
}

# load a plugin
function load_plugin () {
    # gather some info on the plugin
    local PLUGIN_NAME="$(get_plugin_name "$1")"
    local PLUGIN_DIR="$PLUGIN_BASE_DIR/$PLUGIN_NAME"

    # if the directory doesn't exist, throw an error
    if ! test -d "$PLUGIN_DIR"; then
        log_err "you can't load something you don't have"
        return 1
    fi

    if test -f $PLUGIN_BASE_DIR/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh -o -f $PLUGIN_BASE_DIR/$PLUGIN_NAME/_$PLUGIN_NAME; then
        fpath=($PLUGIN_BASE_DIR/$PLUGIN_NAME $fpath)
        return "$?"
    elif test -f $ZSH/plugins/$PLUGIN_NAME; then
        fpath=($ZSH/plugins/$PLUGIN_NAME $fpath)
        return "$?"
    else
        log_err "you can't load something you don't have"
        return 1
    fi
}

# main omz function
function omz () {
    # make sure the action arg was passed
    if test -z "$1"; then
        log_err "you need to specify a command"
        return 1
    fi

    # make sure a second arg was passed unless updating all
    if test -z "$2"; then
        if test "$1" = "update"; then
            update_all
            return "$?"
        elif test "help" = "$1" -o "$1" = "-h" -o "$1" = "--help"; then
            usage
            return 0
        else
            log_err "you need to specify a plugin"
            return 1
        fi
    fi

    # run the proper function
    case $1 in
        add)
            clone_plugin "$2"
            ;;
        update)
            update_plugin "$2"
            ;;
        remove)
            remove_plugin "$2"
            ;;
        load)
            load_plugin "$2"
            ;;
        *)
            log_err "that wasn't a real command"
            ;;
    esac
}

# unfunction has_git log_err run_in_dir create_gh_url get_plugin_name clone_plugin update_plugin update_all remove_plugin load_plugin

