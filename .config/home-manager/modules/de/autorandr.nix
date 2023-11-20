{ config, pkgs, lib, ... }:

{
  programs = {
    autorandr = {
      enable = true;

      profiles = {
        desktop = {
          config = {
            "DisplayPort-0" = {
              mode = "2560x1440";
              rate = "144.00";
              position = "0x0";
              primary = true;
            };
            "DisplayPort-1" = {
              mode = "2560x1440";
              rate = "144.00";
              position = "2560x0";
              crtc = 1;
              primary = false;
            };
          };
          # hooks = {
          #   postswitch = {
          #     "background" = "${config.home.homeDirectory}/.fehbg";
          #     "polybar" = "${config.xdg.configHome}/polybar/launch.sh";
          #   };
          # };
          fingerprint = {
            "DisplayPort-0" =
              "00ffffffffffff004c2d7a70523044302b1e0104b53c22783b6eb5ae4f46a626115054bfef80714f810081c081809500a9c0b300010198e200a0a0a0295008403500ba892100001a000000fd003090d6d63b010a202020202020000000fc004c433237473578540a20202020000000ff00484e4d4e4130323030380a20200195020327f144903f1f042309070783010000e305c0006d1a000002013090000000000000e3060501565e00a0a0a029503020350055502100001a6fc200a0a0a055503020350055502100001a5a8780a070384d403020350055502100001a023a801871382d40582c450055502100001e000000000000000000000000000000004f";
            "DisplayPort-1" =
              "00ffffffffffff0006b3b1275b3601002a1b0104a53c227806ee91a3544c99260f505421080001010101010101010101010101010101565e00a0a0a029503020350056502100001a000000ff002341534f4775634b5271682f64000000fd001ea522f040010a202020202020000000fc00524f4720504732373851520a200124020312412309070183010000654b040001015a8700a0a0a03b503020350056502100001a5aa000a0a0a046503020350056502100001a6fc200a0a0a055503020350056502100001a22e50050a0a0675008203a0056502100001e1c2500a0a0a011503020350056502100001a42f80050a0a0135008203a0056502100001e00a5";
          };
        };
        laptop = {
          config = {
            "eDP-1" = {
              mode = "1920x1080";
              rate = "60.00";
              position = "0x0";
              primary = true;
            };
          };
          # hooks = {
          #   postswitch = {
          #     "background" = "${config.home.homeDirectory}/.fehbg";
          #     "polybar" = "${config.xdg.configHome}/polybar/launch.sh";
          #   };
          # };
          fingerprint = {
            "eDP-1" =
              "00ffffffffffff004d10ba1400000000161d0104a52213780ede50a3544c99260f505400000001010101010101010101010101010101ac3780a070383e403020350058c210000018000000000000000000000000000000000000000000fe004d57503154804c513135364d31000000000002410332001200000a010a202000d3";
          };
        };
        laptop-dual = {
          config = {
            "eDP-1" = {
              mode = "1920x1080";
              rate = "60.00";
              position = "0x0";
              primary = true;
            };
            "DP-1" = {
              mode = "1920x1200";
              # rate = "60.00";
              rate = "59.88";
              position = "1920x0";
              primary = false;
            };
          };
          # hooks = {
          #   postswitch = {
          #     "background" = "${config.home.homeDirectory}/.fehbg";
          #     "polybar" = "${config.xdg.configHome}/polybar/launch.sh";
          #   };
          # };
          fingerprint = {
            "eDP-1" =
              "00ffffffffffff004d10ba1400000000161d0104a52213780ede50a3544c99260f505400000001010101010101010101010101010101ac3780a070383e403020350058c210000018000000000000000000000000000000000000000000fe004d57503154804c513135364d31000000000002410332001200000a010a202000d3";
            "DP-1" =
              "00ffffffffffff00066d33bc0201010123200104b52413782f57a1b33333cc14145054210800d100b3009500810001010101010101019c6800a0a04029603020350068be1000001a3ad100a0a04029603020350068be1000001a000000fc0041534d2d3136305143430a2020000000fd0030a5c8c83c010a202020202020015902032ef2459001020304e200d523097f0783010000e305c000e60605016262006dd85dc4018200000000000000006a5e00a0a0a029503020350068be1000001eaae200a0a04029603020350068be1000001a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000064";
          };
        };
      };
    };
  };
}
