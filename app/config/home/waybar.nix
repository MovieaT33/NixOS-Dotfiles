{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ waybar ];

  home.file.".config/waybar/config".source = ../dotfiles/waybar/config;
}