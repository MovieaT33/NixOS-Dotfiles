{ config, lib, pkgs, ... }:

{
  imports = [
    ./drivers.nix
    ./firewall.nix
    ./pam.nix
    ./passwords.nix
  ];
}