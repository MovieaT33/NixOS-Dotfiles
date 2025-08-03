{ config, pkgs, ... }:

{
  imports = [
    ./system.nix
    ./security.nix
    ./privacy.nix
    ./dev.nix
    ./personal.nix
    ./fun.nix
  ];
}