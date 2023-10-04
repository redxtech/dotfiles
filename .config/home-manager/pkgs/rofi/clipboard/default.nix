{ pkgs ? import <nixpkgs> {}
, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication
# , useWayland ? false
}:

with pkgs; with lib; writeShellApplication {
  name = "rofi-clipboard";
  runtimeInputs = [ gnome.gpaste rofi ];

  text = ''
  _rofi() {
    rofi -theme cyan -theme-str 'listview {columns: 1;} window {width: 50%;}' -format 'i:s' -dmenu -i -l 10 "$@"
  }

  print_history() {
    gpaste-client --oneline |
    while read -r Item; do
      # remove uuid's
      printf '%s\n' "''${Item#* }"
      done | sed 's/^[ \t]*//' # Hide leading whitespace
    }

    print_item() {
      gpaste-client --use-index get "$1" |
    # Remove blank lines from the beginning/end
    sed -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}'
  }
  
  select_item() {
    gpaste-client --use-index select "$1";
  }

  menu () {
    # shellcheck disable=SC2155
    local clip=$(print_history | _rofi -p "Clipboard History 󰄾")
    local index=''${clip%%:*}

    [ -z "$index" ] && exit

    { [ "$index" -lt 0 ] && printf '%s' "''${clip#*:}" | gpaste-client; } || select_item "$index"
  }

  menu
  '';

  meta = with lib; {
    description = "Copy item from clipboard history to clipboard";
    platforms = with platforms; linux;
  };
}
