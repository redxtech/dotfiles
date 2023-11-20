{ config, pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    arandr
    # audacity
    discord
    firefox
    mercury-browser
    multiviewer-for-f1
    neovide
    pavucontrol
    slack
    spotifywm
    xfce.exo
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    vivaldi
    vlc
  ];

  programs = {
    feh.enable = true;

    mpv = {
      enable = true;

      bindings = {
        a = "vf toggle vflip";
        g = "vf toggle hflip";

        WHEEL_UP = "osd-msg-bar seek -10";
        WHEEL_DOWN = "osd-msg-bar seek 10";
        WHEEL_LEFT = "osd-msg-bar seek -5";
        WHEEL_RIGHT = "osd-msg-bar seek 5";

        ## script binds

        # quality menu
        F =
          "script-binding quality_menu/video_formats_toggle #! Stream Quality > Video";
        "Alt+f" =
          "script-binding quality_menu/audio_formats_toggle #! Stream Quality > Audio";
        "Ctrl+r" = "script-binding quality_menu/reload";

        # webtorrent
        p = "script-binding webtorrent/toggle-info";
      };

      config = {
        fs = false;
        autofit-larger = "90%x90%";
        hwdec = "auto";
        volume-max = 250;
        keepaspect = true;
      };

      scripts = with pkgs.mpvScripts; [
        # autocrop
        autoload
        mpris
        quality-menu
        sponsorblock
        thumbfast
        uosc
        webtorrent-mpv-hook
        visualizer
      ];

      scriptOpts = {
        autoload = {
          disabled = false;
          images = false;
          videos = true;
          audio = true;
          ignore_hidden = true;
        };
        visualizer = { name = "showwaves"; };
      };
    };
  };
}
