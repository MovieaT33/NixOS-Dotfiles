{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./network.nix
    ./locale.nix
    ./system.nix
    ./docs.nix
  ];
}