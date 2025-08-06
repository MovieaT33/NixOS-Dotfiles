{ config, ... }:

{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./locale.nix
    ./network.nix
  ];
}