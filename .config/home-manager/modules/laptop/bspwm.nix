{ config, pkgs, lib, ... }:

{
  xsession.windowManager.bspwm = {
    monitors = {
      "eDP-1" = [
        "shell"
        "www"
        "chat"
        "files"
        "music"
        "video"
        "seven"
        "eight"
        "nine"
        "ten"
      ];
    };
  };
}

