#!/usr/bin/env sh

# TODO: add config for other devices

# config values for media-sync

# lock and log file locations
export _MS_LOCKFILE="$HOME/.media-sync.lock"
export _MS_LOGFILE="$HOME/.media-sync.log"

# runtime config
export _MS_TMUX_SESSION="media-sync"
export _MS_BANDWIDTH_LIMIT="5M"
export _MS_RCLONE_CONFIG="$HOME/.config/rclone/rclone.conf"

# remote location config
export _MS_SONARR_REMOTE="sonarr"
export _MS_RADARR_REMOTE="radarr"

# source and destination config for sonarr
export _MS_SONARR_SRC="$_MS_SONARR_REMOTE:/sonarr-lw829"
export _MS_SONARR_DEST="$HOME/wd/Media/sonarr"

# source and destination config for radarr
export _MS_RADARR_SRC="$_MS_RADARR_REMOTE:/radarr-lw829"
export _MS_RADARR_DEST="$HOME/wd/Media/radarr"

