{ config, ... }:

{
  imports = [
    ./system.nix
    ./hardware.nix
    ./boot.nix
    ./locale.nix
    ./network.nix
    ./users.nix
  ];
}