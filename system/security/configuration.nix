{ config, pkgs, ... }:

{
  imports = [
    ./root.nix
    ./pam.nix
    ./passwords.nix
    ./firewall.nix
    ./ssh.nix
    ./drivers.nix
  ];
}