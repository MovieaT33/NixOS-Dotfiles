{ config, pkgs, ... }:

let
  jetbrainsMonoNerd = pkgs.nerdfonts.override {
    fonts = [ "JetBrainsMonoNerd" ];
  };
in
{
  environment.systemPackages = with pkgs; [
    jetbrainsMonoNerd
  ];
}