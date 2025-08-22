{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ kitty ];

  home.file.".config/kitty" = {
    source = ../dotfiles/.config/kitty;
    recursive = true;
  };
}