{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ waybar ];

  home.file.".config/waybar/config.jsonc".source = ../dotfiles/waybar/config.jsonc;
}