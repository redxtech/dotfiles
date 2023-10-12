{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # theme
    vimix-cursor-theme

    # fonts
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    xkcd-font
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Hack"
        "Inconsolata"
        "JetBrainsMono"
        "NerdFontsSymbolsOnly"
        "Noto"
      ];
    })
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    cursorTheme = {
      name = "Vimix-Cursors";
      package = pkgs.vimix-cursor-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3 = { extraConfig = { gtk-application-prefer-dark-theme = 1; }; };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle=hintfull
        gtk-xft-rgba=rgb
        gtk-button-images=1
        gtk-menu-images=1
      '';
    };
  };

  qt = {
    enable = false;

    platformTheme = "gtk";
    # style = {
    #   name = "breeze";
    #   package = pkgs.libsForQt5.breeze-qt5;
    # };
  };

  home.pointerCursor = {
    name = "Vimix-Cursors";
    package = pkgs.vimix-cursor-theme;

    gtk.enable = true;

    x11 = {
      enable = true;
      defaultCursor = "left_ptr";
    };
  };
}
