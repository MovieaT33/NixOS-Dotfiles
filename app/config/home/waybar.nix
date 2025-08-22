{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ waybar ];

  home.file.".config/waybar/config.jsonc".source = ../dotfiles/.config/waybar/config.jsonc;
}