{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_hardened;

  systemd.tmpfiles.rules = [
    "d /etc/nixos 0750 root wheel -"
    # "d /etc/nixos 0700 root root -"
  ];
}