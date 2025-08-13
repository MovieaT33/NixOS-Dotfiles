{ config, ... }:

{
  home.username = "mvt33";
  home.homeDirectory = "/home/mvt33";
  home.stateVersion = "25.05";

  imports = [
    ../../app/config/hyprland.nix
    ../../app/config/sddm.nix
    ../../app/profiles/dev.nix
  ];
}