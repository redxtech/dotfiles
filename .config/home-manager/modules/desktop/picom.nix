{ config, pkgs, lib, ... }:

{
  # set the picom package to use the nixGLIntel wrapper
  systemd.user.services = {
    picom.Service.ExecStart = lib.mkForce (builtins.concatStringsSep " " ([
      "${pkgs.nixgl.nixGLIntel}/bin/nixGLIntel"
      "${config.services.picom.package}/bin/picom"
      "--config ${config.xdg.configFile."picom/picom.conf".source}"
    ] ++ config.services.picom.extraArgs));
  };
}
