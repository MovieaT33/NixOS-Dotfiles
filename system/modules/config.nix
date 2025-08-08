{ config, ... }:

{
  imports = [
    ./system.nix
    ./hardware.nix
    ./boot.nix

    ./zswap.nix
    ./zram.nix

    ./nix.nix

    ./locale.nix
    ./users.nix
    ./network.nix
  ];
}