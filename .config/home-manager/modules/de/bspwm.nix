{ config, pkgs, lib, ... }:

let
  runOnce = cmd: "! pgrep -f ${lib.head (lib.splitString " " cmd)} && ${cmd}";
  runOnceF = cmd: "! pgrep ${lib.head (lib.splitString " " cmd)} && ${cmd}";
  runOnceDesktop = cmd:
    "! pgrep -f ${cmd} && dex ${config.xdg.dataHome}/applications/${cmd}.desktop";
  runWithRule = { cmd, window, rule }:
    "${pkgs.bspwm}/bin/bspc rule -a ${window} -o ${rule} && ${cmd}";
  runOnceWeekend = cmd:
    "test $(${pkgs.coreutils}/bin/date +%u) -lt 5 && " + runOnce cmd;
in {
  xsession.windowManager.bspwm = with builtins; {
    enable = true;

    settings = {
      border_width = 2;
      window_gap = 12;
      split_ratio = 0.52;
      borderless_monocle = true;
      gapless_monocle = true;
      focus_follows_pointer = true;
      pointer_follows_focus = false;

      # theme
      normal_border_color = "#073642";
      active_border_color = "#073642";
      focused_border_color = "#6c71c4";
    };

    rules = {
      Chromium = { desktop = "www"; };
      Vivaldi-stable = { desktop = "www"; };
      firefox = { desktop = "www"; };
      firefoxdeveloperedition = { desktop = "www"; };
      discord = {
        desktop = "chat";
        follow = false;
      };
      Spotify = { desktop = "music"; };
      obsidian = {
        desktop = "^4";
        state = "floating";
        sticky = true;
        hidden = true;
      };
      Plex = { desktop = "video"; };
      plexmediaplayer = { desktop = "video"; };
      Slack = { state = "floating"; };
      Element = {
        desktop = "chat";
        follow = false;
      };
      Plexamp = { state = "floating"; };
      Subl = { desktop = "*"; };
      flameshot = { state = "floating"; };
      "Blueman-manager" = { state = "floating"; };
      "mpv:*:Webcam" = { state = "floating"; };
      "Kupfer.py" = { focus = true; };
      mplayer2 = { state = "floating"; };
      Screenkey = { manage = false; };
      Yad = { state = "floating"; };
    };

    extraConfig = ''
      bspc rule -a '*:*:Open Files' 'desktop=*' 'state=floating'
      bspc rule -a '*:*:Picture in picture' 'state=floating'
      bspc rule -a '*:*:Picture-in-picture' 'state=floating'
    '';

    startupPrograms = with pkgs;
      [
        "${config.home.homeDirectory}/.fehbg"
        "${xorg.xset}/bin/xset r rate 240 40"
        "${xorg.xsetroot}/bin/xsetroot -cursor_name left_ptr"
      ] ++ map runOnce [
        "${networkmanagerapplet}/bin/nm-applet --indicator"
        "${blueman}/bin/blueman-applet"
        "${flameshot}/bin/flameshot"
        "${discord}/bin/discord"
        "${spotifywm}/bin/spotifywm"
        "${xfce.thunar}/bin/thunar --daemon"
        "${obsidian}/bin/obsidian"
      ] ++ map runOnceF [ "${variety}/bin/variety" ]
      ++ map runOnceWeekend [ "${slack}/bin/slack" ] ++ map runWithRule [{
        cmd = "${kitty}/bin/kitty ${btop}/bin/btop";
        window = "kitty";
        rule = "state=floating desktop='^7'";
      }];
  };

  # window resizing data for jgmenu
  xdg.configFile."bspwm/resize-aspect.csv".text = ''
    16x9,${pkgs.resize-aspect}/bin/resize-aspect 16 9
    4x3,${pkgs.resize-aspect}/bin/resize-aspect 4 3
    21x9,${pkgs.resize-aspect}/bin/resize-aspect 12 5
    Balance,${pkgs.bspwm}/bin/bspc node @parent -r .5
  '';
}
