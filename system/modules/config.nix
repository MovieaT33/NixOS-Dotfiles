{ config, ... }:

{
  imports = [
    ./system.nix
    ./hardware.nix
    ./boot.nix
    ./nix.nix
    ./locale.nix
    ./network.nix
    ./users.nix
  ];
}