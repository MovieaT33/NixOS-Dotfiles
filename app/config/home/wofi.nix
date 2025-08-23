{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ wofi ];

  home.file.".config/wofi/style.css".source = ../dotfiles/wofi/style.css;
}