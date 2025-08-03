{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # General
    inetutils
    # mprocs

    # Hyprland
    kitty
  ];
}