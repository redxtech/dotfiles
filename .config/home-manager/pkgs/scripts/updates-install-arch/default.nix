{ pkgs ? import <nixpkgs> {}
, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication
}:

writeShellApplication {
  name = "updates-install-arch";
  runtimeInputs = with pkgs; [ coreutils ];
  # runtimeInputs = with pkgs; [ coreutils polybar ];

  text = ''
  # add /usr/bin to PATH to make sure pacaur is found
  PATH="$PATH:/usr/bin"

  # shellcheck disable=SC2162
  pacaur -Syu && echo "Done - Press any key to exit." && read -n 1
  '';

  meta = with lib; {
    description = "Install updates for Arch Linux";
    platforms = with platforms; linux;
    license = licenses.mit;
  };
}
