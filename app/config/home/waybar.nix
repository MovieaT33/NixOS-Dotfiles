{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ waybar ];

  home.file.".config/waybar/config".source = ../dotfiles/.config/waybar/config;
}