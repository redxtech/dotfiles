{ config, pkgs, lib, ... }:

{
  imports = [
    ./bspwm.nix
    ./desktop-apps.nix
    ./dunst.nix
    ./kitty.nix
    ./picom.nix
    ./polybar.nix
    ./rio.nix
    ./rofi.nix
    ./services.nix
    ./sxhkd.nix
    ./theme.nix
  ];

  xsession = { enable = true; };

  xdg.mimeApps = {
    enable = true;

    associations.added = {
      "image/jpeg" = [ "feh.desktop" "org.gnome.gThumb.desktop" ];
      "image/png" = [ "feh.desktop" "org.gnome.gThumb.desktop" ];
      "image/gif" = [ "feh.desktop" ];
      "image/svg+xml" = [
        "feh.desktop"
        "nvim.desktop"
        "sublime_text.desktop"
        "vivaldi-stable.desktop"
      ];
      "application/xml" = [ "nvim.desktop" "sublime_text.desktop" ];
      "text/plain" = [ "nvim.desktop" "sublime_text.desktop" ];
      "text/html" =
        [ "vivaldi-stable.desktop" "nvim.desktop" "sublime_text.desktop" ];
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
      "video/mp4" = [ "vlc.desktop" ];
    };
    defaultApplications = {
      "x-scheme-handler/http" = [ "vivaldi-stable.desktop" ];
      "x-scheme-handler/https" = [ "vivaldi-stable.desktop" ];
      "text/html" = [ "vivaldi-stable.desktop" ];
      "application/pdf" = [ "vivaldi-stable.desktop" ];
      "inode/directory" = [ "thunar.desktop" ];
      "image/jpeg" = [ "feh.desktop" ];
      "image/png" = [ "feh.desktop" ];
      "text/plain" = [ "nvim.desktop" ];
      "application/json" = [ "nvim.desktop" ];
      "application/x-gnome-saved-search" = [ "thunar.desktop" ];
      "x-scheme-handler/about" = [ "vivaldi-stable.desktop" ];
      "x-scheme-handler/unknown" = [ "vivaldi-stable.desktop" ];
      "x-scheme-handler/webcal" = [ "vivaldi-stable.desktop" ];
      "x-scheme-handler/postman" = [ "Postman.desktop" ];
      "x-scheme-handler/anytype" = [ "anytype.desktop" ];
    };
  };
}

