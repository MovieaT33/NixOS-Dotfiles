{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  home.file.".config/kitty/kitty.conf".source = ../dotfiles/kitty.conf;
}