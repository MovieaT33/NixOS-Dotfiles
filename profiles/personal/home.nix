{ config, ... }:

{
  home.username = "mvt33";
  home.homeDirectory = "/home/mvt33";
  home.stateVersion = "25.05";

  imports = [ ../../app/profiles/dev.nix ];
}