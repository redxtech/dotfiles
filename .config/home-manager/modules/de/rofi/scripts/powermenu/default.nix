{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication, useHostLocker ? false
  # , useWayland ? false
}:

with pkgs;
with lib;
writeShellApplication {
  name = "rofi-powermenu";

  runtimeInputs = [ bspwm coreutils rofi systemd xorg.xset ]
    ++ (if useHostLocker then [ ] else [ betterlockscreen ]);

  text = ''
    lock=" Lock"
    sleep=" Sleep"
    logout="󰍃 Logout"
    restart=" Restart"
    shutdown="⏻ Shutdown"
    cancel="󰕌 Cancel"

    options="$lock\n$sleep\n$logout\n$restart\n$shutdown\n$cancel"

    confirm() {
      confirmation="$(echo -e "Yes\nNo" | rofi -theme confirm-menu -dmenu -i)"

      if [[ "$confirmation" != "Yes" ]]; then
        exit 0
      fi
    }

    answer="$(echo -e "$options" | rofi -theme powermenu -dmenu -i)"

    case $answer in
    "$lock")
      # playerctl pause
      ${
        if useHostLocker then ''
          PATH="$PATH:/usr/bin" /usr/bin/betterlockscreen \
        '' else
          "betterlockscreen \\"
      } --lock dimblur
    ;;
    "$sleep")
      confirm
      xset -display :0 dpms force off
      # notify-send "System slept! (unimplemented)"
      #systemctl suspend --NVIDIA OPEN DRIVERS DON'T SUSPEND
      ;;
    "$logout")
      confirm
      bspc quit
      ;;
    "$restart")
      confirm
      systemctl reboot
      ;;
    "$shutdown")
      confirm
      systemctl poweroff
      ;;
    "$cancel")
      exit 0
      ;;
    esac
  '';

  meta = with lib; {
    description = "A rofi powermenu";
    platforms = with platforms; linux;
  };
}
