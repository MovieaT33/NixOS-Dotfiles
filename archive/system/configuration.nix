{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [
    ./modules/configuration.nix
    ./security/configuration.nix
  ];
}