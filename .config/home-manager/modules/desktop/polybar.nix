{ config, pkgs, lib, ... }:

let
  kittyRun =
    "${pkgs.bspwm}/bin/bspc rule -a kitty -o state=floating; ${pkgs.kitty}/bin/kitty";
in {
  services.polybar = {
    script = ''
      polybar main &
      polybar secondary &
    '';

    settings = with builtins;
      with lib.strings; {
        "bar/secondary" = {
          inherit (config.services.polybar.settings."bar/main")
            width height line-size offset bottom fixed-center wm-restack
            override-redirect enable-ipc background foreground cursor font;

          monitor = "DP-2";

          modules = {
            left =
              concatStringsSep " " [ "bspwm" "margin" "polywins-secondary" ];
            center = config.services.polybar.settings."bar/main".modules.center;
            right = concatStringsSep " "
              (config.device-vars.barRightModules ++ [ "margin" "powermenu" ]);
          };
        };
        "module/polywins-secondary" = {
          inherit (config.services.polybar.settings."module/polywins")
            format label tail type;

          exec = "${pkgs.polywins}/bin/polywins DP-2";
        };
        # "module/updates-ipc" = {
        #   hook =
        #     [ "${pkgs.updates-available-arch}/bin/updates-available-arch" ];

        #   click.left =
        #     "${kittyRun} ${pkgs.updates-install-arch}/bin/updates-install-arch; ${pkgs.polybar}/bin/polybar-msg action '#updates-ipc.hook.0' &";
        # };
        # "module/updates" = {
        #   exec = "${pkgs.updates-available-arch}/bin/updates-available-arch";
        #   click.left =
        #     "${kittyRun} ${pkgs.updates-install-arch}/bin/updates-install-arch";
        # };
      };
  };
}
