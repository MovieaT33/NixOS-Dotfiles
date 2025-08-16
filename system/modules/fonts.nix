{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}