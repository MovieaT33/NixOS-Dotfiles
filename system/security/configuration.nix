{ config, pkgs, ... }:

{
  imports = [
    ./root.nix
    ./pam.nix
    ./passwords.nix
    ./sudo.nix
    ./firewall.nix
    ./tor.nix
    ./ssh.nix
    ./drivers.nix
  ];
}