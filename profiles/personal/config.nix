{ config, ... }:

{
  imports = [
    ../base.nix

    ../../app/config/hyprland.nix
    ../../app/config/sddm.nix
  ];
  home-manager.users.mvt33 = import ./home.nix;
}