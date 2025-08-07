{ config, pkgs, ... }:

{
  imports = [ ../system/config.nix ];

  environment.systemPackages = with pkgs; [ git just ];
}