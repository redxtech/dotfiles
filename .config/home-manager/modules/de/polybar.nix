{config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [ copy-spotify-url ];

  services.polybar = with config.user-theme; {
    enable = true;

    settings = 
    let
      runFloat = window: "${pkgs.bspwm}/bin/bspc rule -a ${window} -o state=floating; ";
      kittyRun = "${runFloat "kitty"} ${pkgs.kitty}/bin/kitty";
      runBtop = "${kittyRun} ${pkgs.btop}/bin/btop";
      runSlurm = "${kittyRun} -o initial_window_width=79c -o initial_window_height=22c ${pkgs.slurm}/bin/slurm -i ${config.device-vars.networkInterface}";

      isWired = (config.device-vars.networkType == "wired");
    in {
      "colours" = {
        # named colours
        bg = bg;
        bg-alt = bg-alt;
        fg = fg;
        fg-alt = fg-alt;
        blue = blue;
        cyan = cyan;
        green = green;
        orange = orange;
        pink = pink;
        purple = purple;
        red = red;
        yellow = yellow;

        trans = "#00000000";
        semi-trans-black = "#aa000000";

        # module colours
        backlight = yellow;
        caffeine = yellow;
        cpu = purple;
        date = green;
        dnd = cyan;
        icon-menu = blue;
        kdeconnect = cyan;
        memory = pink;
        mpris = green;
        network = blue;
        powermenu = red;
        temperature = orange;
        updates = purple;
        weather = yellow;
        volume = orange;
      };
      "bar/main" = {
        width = "100%";
        height = 30;
        line-size = 2;
        offset.y = 0;
        bottom = false;
        fixed-center = true;
        wm-restack = "bspwm";
        override-redirect = false;
        enable-ipc = true;

        background = bg;
        foreground = fg;

        cursor = {
          click = "pointer";
          scroll = "ns-resize";
        };

        tray = {
          background = "\${colours.bg}";
          position = "right";
          maxsize = 20;
          padding.left = 1;
        };

        font = [
          # standard text fonts
          "DankMono:style=Regular:size=10;2"
          "DankMono:style=Bold:size=10;2"
          "DankMono:style=Italic:size=10;2"

          # icon fonts
          "Symbols Nerd Font Mono:style=Regular:size=10;2"
          "Symbols Nerd Font Mono:style=Regular:size=12;2"
          "Symbols Nerd Font Mono:style=Regular:size=8;2"
        ];

        modules = with builtins; {
          left = concatStringsSep " " [
            "icon-menu"
            "margin"
            "bspwm"
            "margin"
            "polywins"
          ];
          center = concatStringsSep " " [
            "player-mpris-tail"
          ];
          right = concatStringsSep " " [
            "updates-ipc-interval"
            "updates-ipc"
            "margin"
            "weather"
            "margin"
            # "kdeconnect"
            # "margin"
            "pipewire"
            "margin"
            "memory"
            "margin"
            "temperature"
            "margin"
            "cpu"
            "margin"
            "network"
            "margin"
            "date"
            "margin"
            "dnd"
          ];
        };
      };
      "settings" = {
        screenchange-reload = true;
      };
      # modules
      "module/icon-menu" = {
        type = "custom/text";
        click = {
          left = "${pkgs.rofi}/bin/rofi -show drun";
          right = "${pkgs.jgmenu}/bin/jgmenu --simple --at-pointer --csv-file=${config.xdg.configHome}/bspwm/resize-aspect.csv";
        };
        content = {
          text = lib.mkDefault "";
          background = "\${colours.icon-menu}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/bspwm" = {
        type = "internal/bspwm";

        format.text = "<label-state> <label-mode>";

        label = {
          focused = {
            text = "%icon%";
            foreground = "\${colours.green}";
            padding = 2;
          };
          occupied = {
            text = "%icon%";
            foreground = "\${colours.purple}";
            padding = 2;
          };
          urgent = {
            text = "%icon%";
            foreground = "\${colours.red}";
            padding = 2;
          };
          empty = {
            text = "%icon%";
            foreground = "\${colours.blue}";
            padding = 2;
          };
          locked = {
            text = "󰍁";
            foreground = "\${colours.yellow}";
            padding = 1;
          };
          sticky = {
            text = "󰐃";
            foreground = "\${colours.yellow}";
            padding = 1;
          };
          private = {
            text = "󰒃";
            foreground = "\${colours.red}";
            padding = 1;
          };
          marked = {
            text = "󰃃";
            foreground = "\${colours.green}";
            padding = 1;
          };
        };
        ws-icon = [
          "shell;"
          "www;"
          "chat;󰙯"
          "files;󰉋"
          "five;"
          "six;"
          "r-www;"
          "music;󰓇"
          "video;󰚺"
          "ten;"
        ];
        ws.icon.default = "";
      };
      "module/cpu" = {
        type = "internal/cpu";

        interval = 1;
        format = {
          text = "<label>%{A}";
          underline = "\${colours.cpu}";
          prefix = {
            text = lib.mkDefault "%{A1:${runBtop}:}󰍛";
            background = "\${colours.cpu}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          text = "%percentage:2%%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/date" = {
        type = "internal/date";

        time = "%H:%M";
        time-alt = "%a, %b %d %H:%M:%S";

        format = {
          text = "<label>";
          underline = "\${colours.date}";
          prefix = {
            text = "󰅐";
            background = "\${colours.date}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          text = "%time%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/dnd" = {
        type = "custom/ipc";

        initial = 1;

        hook = [
          "echo \"%{A1:${pkgs.dunst}/bin/dunstctl set-paused true && ${pkgs.polybar}/bin/polybar-msg hook dnd 2:}󰂚%{A}\" &"
          "echo \"%{A1:${pkgs.dunst}/bin/dunstctl set-paused false && ${pkgs.polybar}/bin/polybar-msg hook dnd 1:}󰂛%{A}\" &"
        ];

        format = {
          background = "\${colours.dnd}";
          foreground = "\${colours.bg}";
          padding = 1;
        };
      };
      # TODO: fix this
      "module/kdeconnect" = {
        type = "custom/script";

        exec = "${config.xdg.configHome}/polybar/scripts/kdeconnect/polybar-kdeconnect.sh -d";
        tail = true;

        click.right = "${pkgs.libsForQt5.kdeconnect-kde}/bin/kdeconnect-app&";

        format = {
          underline = "\${colours.kdeconnect}";
          prefix = {
            background = "\${colours.kdeconnect}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
          label = {
            text = "";
            background = "\${colours.bg-alt}";
            foreground = "\${colours.fg}";
            padding = 1;
          };
        };
      };
      "module/margin" = {
        type = "custom/text";

        content = {
          text = "%{T1} %{T-}";
          foreground = "\${colours.trans}";
        };
      };
      "module/memory" = {
        type = "internal/memory";

        interval = 3;
        format = {
          text = "<label>%{A}";
          underline = "\${colours.memory}";
          prefix = {
            text = lib.mkDefault "%{A1:${runBtop}:}󰘚";
            background = "\${colours.memory}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          text = "%used%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/player-mpris-tail" = {
        type = "custom/script";

        exec = "${pkgs.player-mpris-tail}/bin/player-mpris --icon-playing \"%{T6}󰏤%{T-}\" --icon-paused \"%{T6}󰐊%{T-}\" --icon-stopped \"%{T6}󰓛%{T-}\" -f '{artist} - {title} {icon}'";
        tail = true;

        click = {
          left = "${pkgs.player-mpris-tail}/bin/player-mpris play-pause &";
          right = "${kittyRun} ${pkgs.spotify-tui}/bin/spt";
          middle = "${pkgs.copy-spotify-url}/bin/copy-spotify-url";
        };

        format = {
          underline = "\${colours.mpris}";
          prefix = {
            text = "󰝚";
            background = "\${colours.mpris}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          text = "%output%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/network" = {
        type = "internal/network";

        interval = 3;

        interface-type = config.device-vars.networkType;

        animation-packetloss = [ (if isWired then "󰌙" else "󰤮") "" ];
        animation.packetloss = {
          foreground = "\${colours.red}";
          background = "\${colours.bg-alt}";
          padding.right = 1;
          framerate = 500;
        };
        ramp-signal = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];

        format = let icon = if isWired then "󰈀" else "󰖩"; in { 
          connected = {
            text = if isWired then "<label-connected>%{A}" else "<label-connected><ramp-signal>%{A}";
            underline = "\${colours.network}";
            prefix = {
              text = "%{A1:${runSlurm}:}${icon}";
              background = "\${colours.network}";
              foreground = "\${colours.bg}";
              padding = 1;
            };
          };
          disconnected = {
            text = "<label-disconnected>%{A}";
            underline = "\${colours.network}";
            prefix = {
              text = "%{A1:${runSlurm}:}${icon}";
              background = "\${colours.network}";
              foreground = "\${colours.bg}";
              padding = 1;
            };
          };
          packetloss = {
            text = "<label-packetloss><animation-packetloss>%{A}";
            underline = "\${colours.network}";
            prefix = {
              text = "%{A1:${runSlurm}:}${icon}";
              background = "\${colours.network}";
              foreground = "\${colours.bg}";
              padding = 1;
            };
          };
        };
        label = {
          connected = {
            text = if isWired then "%ifname% %netspeed:07%" else "%essid% %netspeed:07%";
            background = "\${colours.bg-alt}";
            foreground = "\${colours.fg}";
            padding = 1;
          };
          disconnected = {
            text = "%ifname% not connected";
            background = "\${colours.bg-alt}";
            foreground = "\${colours.fg}";
            padding = 1;
          };
          packetloss = {
            text = "%ifname% dropping packets";
            background = "\${colours.bg-alt}";
            foreground = "\${colours.red}";
            padding = 1;
          };
        };
      };
      "module/pipewire" = {
        type = "custom/script";

        tail = true;
        exec = "${pkgs.pipewire-output-tail}/bin/pipewire-output-tail";

        click = {
          left = "${pkgs.pipewire-control}/bin/pipewire-control toggle-mute";
          right = "${runFloat "Pavucontrol"} exec ${pkgs.pavucontrol}/bin/pavucontrol &";
          middle = "${pkgs.pipewire-control}/bin/pipewire-control next";
        };

        scroll = {
          up = "${pkgs.pipewire-control}/bin/pipewire-control volume up";
          down = "${pkgs.pipewire-control}/bin/pipewire-control volume down";
        };

        format = {
          underline = "\${colours.volume}";
          prefix = {
            text = "󰕾";
            background = "\${colours.volume}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/polywins" = {
        type = "custom/script";

        tail = true;

        exec = "${pkgs.polywins}/bin/polywins ${config.device-vars.monitor}";

        format = "<label>";
        label = {
          text = "%output%";
          padding = 1;
        };
      };
      "module/powermenu" = {
        type = "custom/text";

        click.left = "${pkgs.rofi-powermenu}/bin/rofi-powermenu";

        content = {
          text = "⏻";
          background = "\${colours.powermenu}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/temperature" = {
        type = "internal/temperature";

        # device specific: hwmon-path

        interval = 5;
        # thermal-zone = 0;
        # hwmon-path = "";
        warn-temperature = 80;

        format = {
          text = "<label>%{A}";
          underline = "\${colours.temperature}";
          prefix = {
            text = lib.mkDefault "%{A1:${runBtop}:}󰔏";
            background = "\${colours.temperature}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
          warn = {
            text = "<label-warn>";
            underline = "\${colours.red}";
            prefix = {
              text = lib.mkDefault "%{A1:${runBtop}:}󰸁";
              background = "\${colours.red}";
              foreground = "\${colours.bg}";
              padding = 1;
            };
          };
        };
        label = {
          text = "%temperature-c%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
          warn = {
            text = "%temperature-c%";
            background = "\${colours.bg-alt}";
            foreground = "\${colours.fg}";
            padding = 1;
          };
        };
      };
      "module/weather" = {
        type = "custom/script";

        interval = 600;
        exec = "OPENWEATHER_API_KEY=\"$(${pkgs.coreutils}/bin/cat ${config.xdg.configHome}/polybar/openweathermap.txt)\" ${pkgs.weather-bar}/bin/weather-bar -u metric";

        format = {
          underline = "\${colours.weather}";
          prefix = {
            text = "󰅟";
            background = "\${colours.weather}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          text = "%output:0:8:...%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/updates" = {
        type = "custom/script";

        interval = 300;

        # device specific: exec, click.left = ""

        format = {
          underline = "\${colours.updates}";
          prefix = {
            text = "󰏔";
            background = "\${colours.updates}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          text = "%output%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/updates-ipc" = {
        type = "custom/ipc";

        initial = 1;

        # device specific: hook = [], click.left = ""

        format = {
          text = "<output>";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          underline = "\${colours.updates}";
          prefix = {
            text = "󰏔";
            background = "\${colours.updates}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
      };
      "module/updates-ipc-interval" = {
        type = "custom/script";
        exec = "${pkgs.polybar}/bin/polybar-msg action '#updates-ipc.hook.0' 2>&1 1>/dev/null &";
        interval = 300;
      };
    };
  };

  systemd.user.services.polybar = {
    Unit = {
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Install = { WantedBy = [ "graphical-session.target" ]; };
  };
}

