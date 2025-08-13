{ config, ... }:

{
  imports = [ ../base.nix ];
  home-manager.users.mvt33 = import ./home.nix;
}