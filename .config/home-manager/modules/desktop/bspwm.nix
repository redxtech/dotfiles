{config, pkgs, lib, ...}:

{
  xsession.windowManager.bspwm = {
    monitors = {
      "DisplayPort-0" = [ "shell" "www" "chat" "files" "five" "six" ];
      "DisplayPort-1" = [ "r-www" "music" "video" "ten" ];
    };


    startupPrograms = [
      "${pkgs.bspwm}/bin/bspc wm --reorder-monitors DisplayPort-0 DisplayPort-1"
    ];
  };
}

