{ config, pkgs, lib, ... }:

{
  services = {
    picom = {
      enable = true;

      package = pkgs.picom-jonaburg;

      backend = "glx";

      vSync = true;

      settings = {
        blur = {
          method = "dual_kawase";
          strength = 7;
          background = false;
          background-frame = false;
          background-fixed = false;
          kern = "3x3box";
        };

        popup_menu.opacity = 0.95;
        dropdown_menu.opacity = 0.95;

        inavtive-opacity-override = false;

        focus-exclude = [
          "class_g = 'Cairo-clock'"
          "class_g = 'Bar'"
          "class_g = 'slop'"
          "class_g = 'mpv'"
          "class_g = 'Vivaldi-stable'"
          "class_g = 'plexmediaplayer'"
          "class_g = 'vlc'"
          "class_g = 'Io.github.celluloid_player.Celluloid'"
        ];

        mark-wmwin-focused = true;
        mark-ovredir-focused = true;
        detect-rounded-corners = true;
        detect-client-opacity = true;
        use-ewmh-active-win = true;
        detect-transient = true;
        detect-client-leader = true;
        use-damage = false;

        # experimental-backends = true;
        glx-no-stencil = true;
        glx-copy-from-front = false;
        xrender-sync-fence = true;

        unredir-if-possible = false;

        # needs jonaburg's fork
        corner-radius = 0;
        round-borders = 1;

        # needs jonaburg's fork
        transition-length = 300;
        transition-pow-x = 0.1;
        transition-pow-y = 0.1;
        transition-pow-w = 0.1;
        transition-pow-h = 0.1;
        size-transition = true;
      };

      activeOpacity = 1.0;
      inactiveOpacity = 0.85;

      opacityRules = [
        "80:class_g     = 'Bar'"
        "100:class_g    = 'slop'"
        "100:class_g    = 'XTerm'"
        "100:class_g    = 'URxvt'"
        "95:class_g     = 'kitty'"
        "50:class_g     = 'rio'"
        "85:class_g     = 'Xfce4-terminal'"
        "80:class_g     = 'Polybar'"
        "100:class_g    = 'code-oss'"
        "100:class_g 	  = 'VSCodium'"
        "100:class_g    = 'Meld'"
        "70:class_g     = 'TelegramDesktop'"
        "90:class_g     = 'Joplin'"
        "100:class_g    = 'firefox'"
        "100:class_g	  = 'Ryujinx'"
        "100:class_g    = 'LibreWolf'"
      ];

      fade = true;
      fadeDelta = 4;
      fadeExclude = [ "class_g = 'Conky'" "class_g = 'slop'" ];
      fadeSteps = [ 3.0e-2 3.0e-2 ];

      shadow = false;
      shadowOffsets = [ (-5) (-5) ];
      shadowOpacity = 0.5;

      shadowExclude = [
        "! name~=''"
        "name = 'Notification'"
        "name = 'Plank'"
        "name = 'Docky'"
        "name = 'Kupfer'"
        "name = 'xfce4-notifyd'"
        "name *= 'VLC'"
        "name *= 'compton'"
        "name *= 'picom'"
        "name *= 'Chromium'"
        "name *= 'Chrome'"
        "class_g = 'Firefox' && argb"
        "class_g = 'Conky'"
        "class_g = 'Kupfer'"
        "class_g = 'slop'"
        "class_g = 'Synapse'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Polybar'"
        "class_g ?= 'Cairo-dock'"
        "class_g ?= 'Xfce4-notifyd'"
        "class_g ?= 'Xfce4-power-manager'"
        "_GTK_FRAME_EXTENTS@:c"
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      ];

      wintypes = {
        normal = {
          fade = false;
          shadow = false;
        };
        tooltip = {
          fade = true;
          shadow = true;
          opacity = 0.75;
          focus = true;
          full-shadow = false;
        };
        dock = { shadow = false; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 0.95; };
        dropdown_menu = { opacity = 0.95; };
      };
    };
  };
}

