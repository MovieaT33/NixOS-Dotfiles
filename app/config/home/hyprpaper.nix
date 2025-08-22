{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprpaper ];
  home.file.".config/hypr/hyprpaper.conf".source = ../dotfiles/.config/hypr/hyprpaper.conf;
}