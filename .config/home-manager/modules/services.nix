{ config, pkgs, ... }:

{
  services = {
    gnome-keyring = { enable = false; };
    gpg-agent = { enable = false; };
    ssh-agent = { enable = false; };
    udiskie = { enable = false; };
  };
}

