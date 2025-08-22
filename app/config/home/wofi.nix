{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ wofi ];

  home.file.".config/wofi/style.css".source = ../dotfiles/.config/wofi/style.css;
}