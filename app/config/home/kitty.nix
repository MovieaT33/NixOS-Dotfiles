{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    (pkgs.nerdfonts.jetbrains-mono)
  ];

  home.file.".config/kitty/kitty.conf".source = ../dotfiles/kitty.conf;
}