{ config, ... }:

{
  imports = [
    ../base.nix
    ../..//app/profiles/dev.nix
  ];
}