{ config, pkgs, lib, ... }:

{
  xsession.windowManager.bspwm = {
    monitors = {
      "DP-1" = [ "shell" "www" "chat" "files" "five" "six" ];
      "DP-2" = [ "r-www" "music" "video" "ten" ];
    };

    startupPrograms =
      [ "${pkgs.bspwm}/bin/bspc wm --reorder-monitors DP-1 DP-2" ];
  };
}

