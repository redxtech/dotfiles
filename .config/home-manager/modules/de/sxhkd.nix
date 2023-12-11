{ config, pkgs, lib, ... }:

with pkgs;
with lib;
let
  bin = getExe;
  runFloat = window:
    "${pkgs.bspwm}/bin/bspc rule -a ${window} -o state=floating; ";
  kittyRun = "${pkgs.kitty}/bin/kitty --single-instance ";
  cfgDir = config.xdg.configHome;

  nixGLWrap = wrapper: pkg:
    runCommand "${pkg.name}-nixgl-wrapper" { } ''
      mkdir $out
      ln -s ${pkg}/* $out
      rm $out/bin
      mkdir $out/bin
      for bin in ${pkg}/bin/*; do
       wrapped_bin=$out/bin/$(basename $bin)
       echo "exec ${pkgs.lib.getExe wrapper} $bin \$@" > $wrapped_bin
       chmod +x $wrapped_bin
      done
    '';

  ff = "${
      if config.device-vars.isNixOS then
        firefox-devedition-bin
      else
        nixGLWrap nixgl.nixGLIntel firefox-devedition-bin
    }/bin/firefox-developer-edition -p gabe";

  scripts = (import ./rofi/scripts) { inherit pkgs lib config; };

  entries = [
    {
      description = "open terminal";
      command = "${kittyRun}";
      binds = [ "hyper + Return" "super + Return" ];
    }
    {
      description = "open floating terminal";
      command = "${runFloat "kitty"} ${kittyRun}";
      binds = [ "hyper + shift + Return" "super + shift + Return" ];
    }
    {
      description = "open other terminals";
      command = "{${bin alacritty},${xfce.xfce4-terminal}/bin/xfce4-terminal}";
      binds = [ "super + {shift,ctrl} + Return" ];
    }
    {
      description = "open rofi app launcher";
      command = "${bin rofi} -show drun";
      binds = [ "hyper + space" "super + space" ];
    }
    {
      description = "open rofi launchers";
      command = "${bin rofi} -show {run,drun,window,ssh}";
      binds = [ "super + {r,d,ctrl + d,shift + d}" ];
    }
    {
      description = "open ssh launcher";
      command = "${bin rofi} -show ssh";
      binds = [ "hyper + s" ];
    }
    {
      description = "rofi powermenu";
      command = "${scripts.rofi-powermenu}/bin/rofi-powermenu";
      binds = [ "hyper + BackSpace" "super + shift + e" ];
    }
    {
      description = "restart sxhkd";
      command = "${procps}/bin/pkill -USR1 -x sxhkd";
      binds = [ "super + Escape" ];
    }
    # bspwm hotkeys
    {
      description = "quit/restart bspwm";
      command = "${bspwm}/bin/bspc {quit,wm -r}";
      binds = [ "super + alt + {q,r}" ];
    }
    {
      description = "close current window/kill all instances of app";
      command = "${bspwm}/bin/bspc node -{c,k}";
      binds = [ "super + {_,shift+ }q" ];
    }
    {
      description = "close current window";
      command = "${bspwm}/bin/bspc node -c";
      binds = [ "hyper + q" ];
    }
    {
      description = "alternate between the tiled and monocle layout";
      command = "${bspwm}/bin/bspc desktop -l next";
      binds = [ "super + m" ];
    }
    # {
    #   description = "send the newest marked node to the newest preselected node";
    #   command = "${bspwm}/bin/bspc node newest.marked.local -n newest.!automatic.local";
    #   binds = [ "super + y" ];
    # }
    # {
    #   description = "swap the current node and the biggest window";
    #   command = "${bspwm}/bin/bspc node -s biggest.window";
    #   binds = [ "super + g" ];
    # }
    # state flags
    {
      description =
        "set the window mode to {tiled,pseudo_tiled,floating,fullscreen}";
      command =
        "${bspwm}/bin/bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
      binds = [ "super + {t,shift + t,s,f}" ];
    }
    {
      description =
        "toggle the node flag {locked,sticky,private,hidden,marked}";
      command =
        "${bspwm}/bin/bspc node -g {locked,sticky,private,hidden,marked}";
      binds = [ "super + {x,y,z,v,ctrl + m}" ];
    }
    {
      description = "unhide a window";
      command =
        "${bspwm}/bin/bspc node $(${bspwm}/bin/bspc query -N -n .hidden.local | ${coreutils}/bin/tail -n1) -g hidden=off";
      binds = [ "super + ctrl + shift + v" ];
    }
    # focus/swap
    {
      description = "open window switcher";
      command = "${bin rofi} -show window";
      binds = [ "alt + Tab" ];
    }
    {
      description =
        "{focus,move} the node in the {west,south,north,east} direction";
      command = "${bspwm}/bin/bspc node -{f,s} {west,south,north,east}";
      binds = [ "super + {_,shift + }{h,j,k,l}" ];
    }
    {
      description = "focus the {parent,brother,first,second} node";
      command = "${bspwm}/bin/bspc node -f @{parent,brother,first,second}";
      binds = [ "super + {p,b,comma,period}" ];
    }
    {
      description = "focus the {next,previous} node in the current desktop";
      command = "${bspwm}/bin/bspc node -f {next,prev}.local.!hidden.window";
      binds = [ "super + {_,shift + }c" ];
    }
    {
      description = "focus the {next,previous} desktop in the current monitor";
      command = "${bspwm}/bin/bspc desktop -f {prev,next}.local";
      binds = [ "super + bracket{left,right}" ];
    }
    {
      description = "focus the last {node,desktop}";
      command = "${bspwm}/bin/bspc {node,desktop} -f last";
      binds = [ "super + {grave,Tab}" ];
    }
    # {
    #   description = "focus the older or newer node in the focus history";
    #   command = "${bspwm}/bin/bspc wm -h off; ${bspwm}/bin/bspc node {older,newer} -f; ${bspwm}/bin/bspc wm -h on";
    #   binds = [ "super + {o,i}" ];
    # }
    {
      description = "{focus,send node to} desktop {1,2,3,4,5,6,7,8,9,10}";
      command = "${bspwm}/bin/bspc {desktop -f,node -d} '^{1-9,10}'";
      binds = [ "super + {_,shift + }{1-9,0}" ];
    }
    {
      description = "send to other monitor";
      command = "${bspwm}/bin/bspc node -m next";
      binds = [ "super + o" ];
    }
    # preselect
    {
      description = "preselect the direction {west,south,north,east}";
      command = "${bspwm}/bin/bspc node -p {west,south,north,east}";
      binds = [ "super + ctrl + {h,j,k,l}" ];
    }
    {
      description = "preselect the ratio {1-9}";
      command = "${bspwm}/bin/bspc node -o 0.{1-9}";
      binds = [ "super + ctrl + {1-9}" ];
    }
    {
      description = "cancel the preselection for the focused node";
      command = "${bspwm}/bin/bspc node -p cancel";
      binds = [ "super + ctrl + space" ];
    }
    {
      description = "cancel the preselection for the focused desktop";
      command =
        "${bspwm}/bin/bspc query -N -d | ${coreutils}/bin/xargs -I id -n 1 ${bspwm}/bin/bspc node id -p cancel";
      binds = [ "super + ctrl + shift + space" ];
    }
    # move/resize
    {
      description =
        "expand a window by moving one its {left,bottom,top,right} side outward";
      command =
        "${bspwm}/bin/bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
      binds = [ "super + alt + {h,j,k,l}" ];
    }
    {
      description =
        "contract a window by moving its {left,bottom,top,right} side inward";
      command =
        "${bspwm}/bin/bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
      binds = [ "super + alt + shift + {h,j,k,l}" ];
    }
    {
      description = "move a floating window {left,down,up,right}";
      command = "${bspwm}/bin/bspc node -v {-20 0,0 20,0 -20,20 0}";
      binds = [ "super + {Left,Down,Up,Right}" ];
    }
    {
      description = "snap current window to an aspect ratio";
      command =
        "${jgmenu}/bin/jgmenu --simple --at-pointer --csv-file=${cfgDir}/bspwm/resize-aspect.csv";
      binds = [ "hyper + shift + r" ];
    }
    # multimedia keys
    {
      description = "${
          bin playerctl
        } {play/pause,skip,skip back} {spotify,chromium,mpv,general}";
      command = ''
        ${
          bin playerctl
        } --player={spotify,chromium,mpv,Plexamp,""} {play-pause,next,previous}'';
      binds = [ "{_,shift,ctrl,alt,hyper} + XF86Audio{Play,Next,Prev}" ];
    }
    {
      description = "volume {up,down}";
      command = "${pipewire-control}/bin/pipewire-control volume {up,down}";
      binds = [ "XF86Audio{Raise,Lower}Volume" ];
    }
    {
      description = "toggle mute";
      command = "${pipewire-control}/bin/pipewire-control toggle-mute";
      binds = [ "XF86AudioMute" ];
    }
    # function keys
    {
      description = "brightness {up,down}";
      command = "${bin xorg.xbacklight} -{inc,dec} 5";
      binds = [ "XF86MonBrightness{Up,Down}" ];
    }
    {
      description = "screenshot {gui,screen (clipboard)}";
      command = "${bin flameshot} {gui,screen -c}";
      binds = [ "{_,shift} + Print" ];
    }
    {
      description = "screenshot selection";
      command = "${scripts.rofi-screenshot}/bin/rofi-screenshot";
      binds = [ "super + Print" ];
    }
    # shortcut keys
    {
      description = "launch browser";
      command = ff;
      binds = [ "super + w" ];
    }
    {
      description = "open {discord,thunar,plex}";
      # command = "{${bin discord},${bin xfce.thunar},${bin plex-media-player}";
      command = "{discord,thunar,plex-desktop}";
      binds = [ "hyper + {d,f,p}" ];
    }
    {
      description = "toggle obsidian";
      command =
        "${bspwm}/bin/bspc node $(${xdo}/bin/xdo id -N obsidian) -g hidden -f";
      binds = [ "hyper + n" ];
    }
    {
      description = "focus {firefox,discord,spotify,thunar,plex}";
      command = ''
        ${wmctrl}/bin/wmctrl -a {"Firefox Develop Edition",discord,spotify,thunar,plex}'';
      binds = [ "hyper + alt + {w,d,s,f,p}" ];
    }
    {
      description = "terminal exec {btop,ranger}";
      command =
        "${runFloat "kitty"} ${kittyRun} {${btop}/bin/btop,${bin ranger}}";
      binds = [ "hyper + {m,r}" ];
    }
    # various miscellany
    {
      description = "upgrade packages";
      command = "${
          runFloat "kitty"
        } ${kittyRun} ${pkgs.updates-install-arch}/bin/updates-install-arch";
      binds = [ "hyper + u" ];
    }
    {
      description = "{pop most recent,close all} notification";
      command = "${dunst}/bin/dunstctl {history-pop,close-all}";
      binds = [ "hyper + {_,shift + }h" ];
    }
    {
      description = "{stream,download} from youtube";
      command = "${scripts.rofi-youtube}/bin/rofi-youtube {stream,download}";
      binds = [ "hyper + {_,shift + }y" ];
    }
    {
      description = "copy & paste from clipboard history";
      command = "${scripts.rofi-clipboard}/bin/rofi-clipboard";
      binds = [ "hyper + c" ];
    }
    {
      description = "make a {web,kagi} search";
      command = "${scripts.rofi-web}/bin/rofi-web {_,default}";
      binds = [ "hyper + {_,shift + }b" ];
    }
    {
      description = "pull up emoji selector";
      command = ''
        ${
          rofi.override (old: { plugins = [ rofi-emoji ]; })
        }/bin/rofi -modi emoji -show emoji -display-emoji -matching {glob,fuzzy} "Emoji 󰄾"'';
      binds = [ "hyper + {_,shift +} e" ];
    }
    {
      description = "show webcam";
      command = "${config.home.homeDirectory}/bin/mpvcam"; # TODO: fix
      binds = [ "hyper + shift + i" ];
    }
    {
      description = "go to {previous,next} wallpapers with variety";
      command = "${variety}/bin/variety --{previous,next}";
      binds = [ "hyper + bracket{left,right}" ];
    }
    # {
    #   description = "toggle {night,day} mode";
    #   command = "${bin redshift} -O {3500,6500}";
    #   binds = [ "hyper + bracket{down,up}" ];
    # }
    {
      description = "show keybind cheatsheet";
      command =
        "${rofi}/bin/rofi  -dmenu -i -p 'Hotkeys 󰄾' < ${config.xdg.dataHome}/sxhkd/cheatsheet | ${choose}/bin/choose -f ' => ' 2 | ${bash}/bin/bash";
      # command = "${bin sxhkhmenu} --opt-args=\"-dmenu -i -p Keybinds:\"";
      binds = [ "super + F1" ];
    }
  ];

  entryToBind = { description, command, binds }: (''
    # ${description}
    ${strings.concatMapStringsSep "\n" (bind: ''
      ${bind}
      	${command}'') binds}
  '');

  entryToCheatSheet = { description, command, binds }: (''
    ${strings.concatMapStringsSep "\n"
    (bind: "${bind} => ${description} => ${command}") binds}
  '');

  keybindingsStr =
    strings.concatStringsSep "\n" (lists.map entryToBind entries);
  cheatsheetStr =
    strings.concatStringsSep "\n" (lists.map entryToCheatSheet entries);
in {

  home.packages = [ sxhkd ];

  xdg.configFile."sxhkd/sxhkdrc".text = keybindingsStr;
  xdg.dataFile."sxhkd/cheatsheet".text = cheatsheetStr;

  systemd.user.services.sxhkd = {
    Unit = {
      Description = "simple X hotkey daemon";
      After = [ "setxmodmap.service" ];
      PartOf = [ "graphical-session.target" ];
      X-Restart-Triggers = "${config.xdg.configHome}/sxhkd/sxhkdrc";
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      Type = "exec";
      ExecStart = "${sxhkd}/bin/sxhkd";
      Restart = "on-failure";
    };
  };
}
