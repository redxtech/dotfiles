#!/bin/bash

# PARAMETERS:
# $1: The first passed parameter is the absolute path to the wallpaper image to be set as wallpaper
# (after effects, clock, etc. are applied).
#
# $2: The second passed parameter is "auto" when the wallpaper is changed automatically (i.e. regular change), "manual"
# when the user has triggered the change, or "refresh" when the change is triggered by a change in quotes, clock, etc.
#
# $3: The third passed parameter is the absolute path to the original wallpaper image (before effects, clock, etc.)
#
# $4: Fourth parameter comes from the display mode setting: "os" means that set_wallpaper should try to
# leave the OS setting unchanged. "zoom" means to try to fill the screen fully with the provided image.
# Other parameters that could be passed are the scaling modes used by GNOME:
# "centered", "scaled", "stretched", "zoom", "spanned", "wallpaper"
#
# EXAMPLE:
# echo "$1" # /home/username/.config/variety/wallpaper/wallpaper-clock-fac0eef772f9b03bd9c0f82a79d72506.jpg
# echo "$2" # auto
# echo "$3" # /home/username/Pictures/Wallpapers/Nature/green-tunnel-1920x1080-wallpaper-861.jpg

WP=$1

# Gnome 3, Unity
if [[ "${XDG_CURRENT_DESKTOP:-none}" == *"GNOME"* ]] || [[ "${XDG_CURRENT_DESKTOP:-none}" == *"Unity"* ]]; then
	gsettings set org.gnome.desktop.background picture-uri "file://$WP" 2>/dev/null
	gsettings set org.gnome.desktop.background picture-uri-dark "file://$WP" 2>/dev/null
	if [[ "$4" =~ ^(wallpaper|centered|scaled|stretched|zoom|spanned)$ ]]; then
		gsettings set org.gnome.desktop.background picture-options "$4"
	fi
	if [ "$(gsettings get org.gnome.desktop.background picture-options)" == "'none'" ]; then
		gsettings set org.gnome.desktop.background picture-options 'zoom'
	fi

	# GNOME Screensaver / Lock screen - thanks to George C. de Araujo for the patch
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$WP" 2>/dev/null
	if [[ "$4" =~ ^(wallpaper|centered|scaled|stretched|zoom|spanned)$ ]]; then
		gsettings set org.gnome.desktop.screensaver picture-options "$4"
	fi
	if [ "$(gsettings get org.gnome.desktop.screensaver picture-options)" == "'none'" ]; then
		gsettings set org.gnome.desktop.screensaver picture-options 'zoom'
	fi
else
	# for simple wms, use feh
	feh --bg-fill "$WP" 2>/dev/null
fi
# =====================================================================================

# symlink to ~/.config/wall
ln -sfT "$3" "$HOME/.config/wall.png"

# generate lockscreen image
betterlockscreen --update "$WP" &

exit 0
