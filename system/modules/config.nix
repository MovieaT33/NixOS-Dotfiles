{ config, ... }:

{
  imports = [
    ./system.nix
    ./hardware.nix
    ./boot.nix

    ./zswap.nix
    ./zram.nix

    ./nix.nix
    ./repo.nix

    ./locale.nix
    ./users.nix
    ./network.nix
  ];
}