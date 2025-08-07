{ config, ... }:

{
  imports = [
    ./system.nix
    ./hardware.nix
    ./boot.nix
    ./swap.nix
    ./nix.nix
    ./locale.nix
    ./network.nix
    ./users.nix
  ];
}