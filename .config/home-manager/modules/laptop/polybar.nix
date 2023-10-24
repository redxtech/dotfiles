{ config, pkgs, lib, ... }:

let
  insertAt = with pkgs.lib.lists;
    index: value: list:
    let
      before = take index list;
      after = drop index list;
    in before ++ values ++ after;

  kittyRun =
    "${pkgs.bspwm}/bin/bspc rule -a kitty -o state=floating; ${pkgs.kitty}/bin/kitty --single-instance";
in {
  services.polybar = {
    script = ''
      polybar main &
    '';

    settings = {
      "module/backlight" = {
        type = "internal/backlight";

        card = "intel_backlight";
        enable-scroll = true;

        format = {
          underline = "\${colours.backlight";
          prefix = {
            text = "󰖨";
            background = "\${colours.backlight}";
            foreground = "\${colours.bg}";
            padding = 1;
          };
        };
        label = {
          text = "%percentage%%";
          background = "\${colours.bg-alt}";
          foreground = "\${colours.fg}";
          padding = 1;
        };
      };
      "module/battery" = {
        type = "internal/battery";

        battery = "BAT0";
        adapter = "AC";
        full-at = 98;

        ramp-capacity = [ "󰂃" "󰁺" "󰁻" "󰁼" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        ramp.capacity = {
          foreground = "\${colours.fg}";
          background = "\${colours.bg-alt}";
          padding = 1;
        };

        animation-charging = [ "󰂃" "󰁺" "󰁻" "󰁼" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        animation.charging = {
          foreground = "\${colours.fg}";
          background = "\${colours.bg-alt}";
          padding = 1;
        };

        format = {
          charging = {
            text = "<label-charging><animation-charging>";
            underline = "\${colours.cyan}";
            prefix = {
              text = "󰂄";
              background = "\${colours.cyan}";
              foreground = "\${colours.bg}";
              padding = 1;
            };
          };
          discharging = {
            text = "<label-discharging><ramp-capacity>";
            underline = "\${colours.cyan}";
            prefix = {
              text = "󰁹";
              background = "\${colours.cyan}";
              foreground = "\${colours.bg}";
              padding = 1;
            };
          };
          full = {
            text = "<label-full><ramp-capacity>";
            underline = "\${colours.green}";
            prefix = {
              text = "󰁹";
              background = "\${colours.green}";
              foreground = "\${colours.bg}";
              padding = 1;
            };
          };
        };
        label = {
          charging = {
            text = "<animation-charging>";
            background = "\${colours.bg-alt}";
            padding = 1;
          };
          discharging = {
            text = "%percentage%%";
            # text = "<ramp-capacity>";
            background = "\${colours.bg-alt}";
            padding = 1;
          };
          full = {
            text = "%percentage%%";
            background = "\${colours.bg-alt}";
            padding = 1;
          };
        };
      };
      # "module/updates-ipc" = {
      #   hook = [
      #     "${pkgs.updates-available-arch}/bin/updates-available-nix"
      #   ];

      #   click.left = "${kittyRun} ${pkgs.updates-install-arch}/bin/updates-install-nix; ${pkgs.polybar}/bin/polybar-msg action '#updates-ipc.hook.0' &";
      # };
      # "module/updates" = {
      #   # TODO: find nix equivalent

      #   exec = "echo 1";
      #   click-left = "${kittyRun} ${pkgs.zsh}/bin/zsh -c \"nix-channel --update; echo Done - Press enter to exit; read\"";
      # };
    };
  };
}
