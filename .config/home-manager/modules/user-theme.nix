# A theme format for use in desktop applications and editors
{ lib, config, pkgs, ... }:
let
  colour = lib.mkOptionType {
    name = "colour";
    description = "hex colour";
    check = s:
      lib.types.str.check s && builtins.match "#[0-9a-fA-F]{6}" s != null;
  };

  mkColourOption = name: default:
    (lib.mkOption {
      type = colour;
      description = "The colour value for the name '${name}'.";
      inherit default;
    });
in {
  # dracula theme
  options.user-theme = builtins.mapAttrs mkColourOption rec {
    # standard colours
    bg = "#282a36";
    bg-alt = "#44475a";
    fg = "#f8f8f2";
    fg-alt = "#6272a4";
    blue = "#6272a4";
    cyan = "#8be9fd";
    green = "#50fa7b";
    orange = "#ffb86c";
    pink = "#ff79c6";
    purple = "#bd93f9";
    red = "#ff5555";
    yellow = "#f1fa8c";

    # xresources colours
    color0 = "#000000";
    color8 = "#4d4d4d";
    color1 = "#ff5555";
    color9 = "#ff6e67";
    color2 = "#50fa7b";
    color10 = "#5af78e";
    color3 = "#f1fa8c";
    color11 = "#f4f99d";
    color4 = "#bd93f9";
    color12 = "#caa9fa";
    color5 = "#ff79c6";
    color13 = "#ff92d0";
    color6 = "#8be9fd";
    color14 = "#9aedfe";
    color7 = "#bfbfbf";
    color15 = "#e6e6e6";

    # one-dark theme
    # bg = "#282c34";
    # bg-alt = "#21242b";
    # base0 = "#1B2229";
    # base1 = "#1c1f24";
    # base2 = "#202328";
    # base3 = "#23272e";
    # base4 = "#3f444a";
    # base5 = "#5B6268";
    # base6 = "#73797e";
    # base7 = "#9ca0a4";
    # base8 = "#DFDFDF";
    # fg = "#bbc2cf";
    # fg-alt = "#5B6268";
    # grey = base4;
    # red = "#ff6c6b";
    # orange = "#da8548";
    # green = "#98be65";
    # teal = "#4db5bd";
    # yellow = "#ECBE7B";
    # blue = "#51afef";
    # dark-blue = "#2257A0";
    # magenta = "#c678dd";
    # violet = "#a9a1e1";
    # cyan = "#46D9FF";
    # dark-cyan = "#5699AF";
  };
}
