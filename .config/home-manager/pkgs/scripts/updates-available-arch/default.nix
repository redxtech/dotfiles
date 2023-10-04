{ pkgs ? import <nixpkgs> {}
, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication
}:

writeShellApplication {
  name = "updates-available-arch";
  runtimeInputs = with pkgs; [ coreutils ];

  text = ''
  # add /usr/bin to PATH to make sure checkupdates and pacaur are found
  PATH="$PATH:/usr/bin"

  if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
      updates_arch=0
  fi

  if ! updates_aur=$(pacaur -Qum 2>/dev/null | wc -l); then
      updates_aur=0
  fi

  updates=$((updates_arch + updates_aur))

  if [ "$updates" -gt 0 ]; then
      echo " $updates "
  else
      echo ""
  fi
  '';

  meta = with lib; {
    description = "Check if updates are available for Arch Linux";
    platforms = with platforms; linux;
    license = licenses.mit;
  };
}
