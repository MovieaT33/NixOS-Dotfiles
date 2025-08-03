{ config, pkgs, ... }:

{
  imports = [
    ./root.nix
    ./pam.nix
    ./passwords.nix
    ./sudo.nix
    ./firewall.nix
    ./ssh.nix
    ./drivers.nix
  ];
}