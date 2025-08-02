{ config, pkgs, ... }:

{
  imports = [
    ./drivers.nix
    ./firewall.nix
    ./pam.nix
    ./passwords.nix
    ./root.nix
    ./ssh.nix
  ];
}