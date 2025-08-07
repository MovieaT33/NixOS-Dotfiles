{ config, ... }:

{
  imports = [
    ./system.nix
    ./hardware.nix
    ./boot.nix

    ./zswap.nix
    ./swap.nix
    ./zram.nix

    ./nix.nix

    ./locale.nix
    ./network.nix
    ./users.nix
  ];
}