{ pkgs ? import <nixpkgs> {}
, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication
, useWayland ? false
}:

with pkgs; with lib; writeShellApplication {
  name = "rofi-screenshot";
  runtimeInputs = [ coreutils flameshot rofi (if useWayland then wl-clipboard else xclip) ];

  text = ''
  _rofi() {
    rofi -theme orange -theme-str 'listview {columns: 1;} window {width: 50%;}' -format 'i:s' -dmenu -no-custom -i "$@"
  }

  # list of screenshot options
  declare -A SCREENSHOTS
  SCREENSHOTS=(
    ["selection"]="flameshot gui"
    ["selection (copy)"]="flameshot gui --clipboard"
    ["current monitor"]="flameshot screen"
    ["current monitor (copy)"]="flameshot screen --clipboard"
    ["current monitor (upload)"]="flameshot screen --upload"
    ["current monitor (save)"]="flameshot screen --path ~/Pictures/Screenshots"
    )

    # list of options
    gen_opts () {
      for o in "''${!SCREENSHOTS[@]}"; do
      echo "$o => ''${SCREENSHOTS["$o"]}"
      done
    }

    main () {
	    # get the choice of which screenshot option
      choice="$( (gen_opts) | _rofi -p "Screenshot 󰄾" | awk -F ' => ' '{ print $1 }')"

	    # lookup the respective command
      command=''${SCREENSHOTS["$choice"]}

	    # run the screenshot command
      $command
    }

    main
  '';

  meta = with lib; {
    description = "A rofi menu for taking screenshots";
    platforms = with platforms; linux;
  };
}
