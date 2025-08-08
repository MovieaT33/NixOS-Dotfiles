{ config, ... }:

{
  imports = [
    ./general.nix
    ./kernel.nix
    ./apparmor.nix
    ./audit.nix
    ./journald.nix
    ./nix.nix
    ./sudo.nix
    ./root.nix
    ./network/config.nix

    ./hardening.nix
  ];
}