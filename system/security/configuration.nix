{ config, pkgs, ... }:

{
  imports = [
    ./root.nix
    # FIXME: ./pam.nix
    # FIXME: ./passwords.nix
    ./firewall.nix  # TODO: implement
    ./tor.nix
    ./tor-newnym.nix  # FIXME: tor-newnym.service
    ./ssh.nix  # TODO: implement
    # FIXME: ./drivers.nix
  ];
}