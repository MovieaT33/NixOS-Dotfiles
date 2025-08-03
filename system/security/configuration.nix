{ config, pkgs, ... }:

{
  imports = [
    ./kernel.nix  # TODO: check
    ./security.nix  # TODO: check
    ./apparmor.nix
    ./root.nix
    # FIXME: ./pam.nix
    # FIXME: ./passwords.nix
    ./firewall.nix  # TODO: implement
    ./tor.nix
    ./tor-newnym.nix
    # TODO: ./ssh.nix
    # FIXME: ./drivers.nix
  ];
}