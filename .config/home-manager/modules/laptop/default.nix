{config, pkgs, lib, ...}:

{
  imports = [
    ../de
    ./device-vars.nix
    ./polybar.nix
    ./bspwm.nix
  ];

  xsession.initExtra = [
    # change trackpad scrolling direction
    "xinput --set-prop \"$(xinput list | egrep 'slave.*pointer' | grep -v XTEST | grep 'Touchpad' | sed -e 's/^.*id=//' -e 's/\s.*$//')\"  \"libinput Natural Scrolling Enabled\" 1"
  ];
}
