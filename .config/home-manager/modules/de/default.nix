{ config, pkgs, lib, ... }:

{
  imports = [
    ./autorandr.nix
    ./bspwm.nix
    ./desktop-apps.nix
    ./dunst.nix
    ./kitty.nix
    ./picom.nix
    ./polybar.nix
    ./rio.nix
    ./rofi
    ./services.nix
    ./sxhkd.nix
    ./theme.nix
  ];

  xsession = { enable = true; };

  xdg.mimeApps = let
    vivaldiDesktop = if config.device-vars.isNixOS then
      "vivaldi.desktop"
    else
      "vivaldi-stable.desktop";
  in {
    enable = true;

    associations.added = {
      "image/jpeg" = [ "feh.desktop" "org.gnome.gThumb.desktop" ];
      "image/png" = [ "feh.desktop" "org.gnome.gThumb.desktop" ];
      "image/gif" = [ "feh.desktop" ];
      "image/svg+xml" =
        [ "feh.desktop" "nvim.desktop" "sublime_text.desktop" vivaldiDesktop ];
      "application/xml" = [ "nvim.desktop" "sublime_text.desktop" ];
      "text/plain" = [ "nvim.desktop" "sublime_text.desktop" ];
      "text/html" = [ vivaldiDesktop "nvim.desktop" "sublime_text.desktop" ];
      "application/javascript" = [ "nvim.desktop" "sublime_text.desktop" ];
      "application/json" = [
        "org.gnome.TextEditor.desktop"
        "sublime_text.desktop"
        "nvim.desktop"
      ];
      "application/x-raw-disk-image" = [ "7zFM.desktop" ];
      "application/octet-stream" = [ "nvim.desktop" "sublime_text.desktop" ];
      "application/toml" = [ "nvim.desktop" "sublime_text.desktop" ];
      "application/x-shellscript" =
        [ "nvim.desktop" "kitty-open.desktop" "sublime_text.desktop" ];
      "audio/ogg" = [ "mpv.desktop" "vlc.desktop" ];
      "video/mp4" = [ "mpv.desktop" "vlc.desktop" ];
    };
    defaultApplications = {
      "x-scheme-handler/http" = [ vivaldiDesktop ];
      "x-scheme-handler/https" = [ vivaldiDesktop ];
      "text/html" = [ vivaldiDesktop ];
      "application/pdf" = [ vivaldiDesktop ];
      "inode/directory" = [ "thunar.desktop" ];
      "image/jpeg" = [ "feh.desktop" ];
      "image/png" = [ "feh.desktop" ];
      "text/plain" = [ "nvim.desktop" ];
      "application/json" = [ "nvim.desktop" ];
      "application/x-gnome-saved-search" = [ "thunar.desktop" ];
      "video/mp4" = [ "mpv.desktop" ];
      "x-scheme-handler/about" = [ vivaldiDesktop ];
      "x-scheme-handler/unknown" = [ vivaldiDesktop ];
      "x-scheme-handler/webcal" = [ vivaldiDesktop ];
      "x-scheme-handler/postman" = [ "Postman.desktop" ];
      "x-scheme-handler/anytype" = [ "anytype.desktop" ];
    };
  };
}

