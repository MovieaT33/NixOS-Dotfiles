{ config, ... }:

{
  imports = [
    ../base.nix
    ../../app/config/sddm.nix
  ];
  home-manager.users.mvt33 = import ./home.nix;
}