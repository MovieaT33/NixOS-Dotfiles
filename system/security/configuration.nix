{ config, pkgs, ... }:

{
  imports = [
    ./root.nix
    ./pam.nix
    ./passwords.nix
    ./sudo.nix
    ./firewall.nix
    ./tor.nix
    ./tor-newnym.nix
    ./ssh.nix
    ./drivers.nix
  ];
}