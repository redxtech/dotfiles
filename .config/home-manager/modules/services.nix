{ config, pkgs, ... }:

{
  services = {
    darkman = { enable = false; };
    gnome-keyring = { enable = false; };
    gpg-agent = { enable = false; };
    ssh-agent = { enable = false; };
    udiskie = { enable = false; };
  };
}

