{ config, pkgs, lib, ... }:

{
  services = {
    blueman-applet = { enable = false; };

    caffeine = { enable = false; };

    clipman = { enable = false; };

    easyeffects.enable = false;

    flameshot = { enable = false; };

    kdeconnect = {
      enable = true;
      indicator = true;
    };

    keybase = { enable = false; };
    megasync = { enable = false; };
    network-manager-applet = { enable = false; };
    plex-mpv-shim = { enable = false; };

    playerctld = { enable = true; };
    redshift = { enable = false; };

    spotifyd = {
      enable = true;

      settings = {
        global = {
          username = "redxtech";
          password_cmd =
            "${pkgs.coreutils}/bin/cat ${config.xdg.configHome}/spotify-tui/spotify.txt";

          use_mpris = true;
          backend = "pulseaudio";

          device_type = "computer";
          device_name = "desktop-spotifyd";

          bitrate = 320;
        };
      };
    };

    xidlehook = {
      enable = false;

      detect-sleep = true;
      not-when-audio = true;
      not-when-fullscreen = true;

      # TODO: figure out betterlockscreen PAM stuff
      timers = [
        # {
        #   # delay = 300;
        #   delay = 30;
        #   command = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock dimblur -- --debug";
        # }
        # {
        #   delay = 300;
        #   command = "xset dpms force off";
        # }
      ];
    };
  };

  systemd.user.services = {
    setxmodmap = {
      Unit = {
        Description = "Set up keyboard in X";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Install = { WantedBy = [ "graphical-session.target" ]; };

      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart =
          "${pkgs.xorg.xmodmap}/bin/xmodmap ${config.home.homeDirectory}/.Xmodmap";
      };
    };

    xplugd-xmodmap = {
      Unit = {
        Description = "Rerun setxmodmap.service when I/O is changed";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Install = { WantedBy = [ "graphical-session.target" ]; };

      Service = {
        Type = "forking";
        ExecStart = let
          script = pkgs.writeShellScript "xplugrc" ''
            case "$1,$3" in
              keyboard,connected)
              systemctl --user restart setxmodmap.service
              ;;
            esac
          '';
        in "${pkgs.xplugd}/bin/xplugd ${script}";
      };
    };

    gpaste = {
      Unit = {
        Description = "Start gpaste daemon";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Install = { WantedBy = [ "graphical-session.target" ]; };

      Service = {
        Type = "dbus";
        BusName = "org.gnome.GPaste";
        ExecStart = "${pkgs.gnome.gpaste}/libexec/gpaste/gpaste-daemon";
      };
    };

    # TODO: sort out polkit

    # polkit-authentication-agent = {
    #   Unit = {
    #     Description = "Polkit authentication agent";
    #     Documentation = "https://gitlab.freedesktop.org/polkit/polkit/";
    #     After = [ "graphical-session-pre.target" ];
    #     PartOf = [ "graphical-session.target" ];
    #   };

    #   Service = {
    #     ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    #     Restart = "always";
    #     BusName = "org.freedesktop.PolicyKit1.Authority";
    #   };

    #   Install.WantedBy = [ "graphical-session.target" ];
    # };
  };
}

