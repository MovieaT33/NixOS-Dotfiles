{ config, ... }:

{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./system.nix
    ./locale.nix
    ./network.nix
  ];
}