{ config, pkgs, ... }:

{
  imports = [
    ./system.nix
    ./security.nix
    ./dev.nix
    ./personal.nix
    ./fun.nix
  ];
}