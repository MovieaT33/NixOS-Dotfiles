{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ waybar ];
    file.".config/waybar/config.jsonc".source = ../dotfiles/waybar/config.jsonc;
  };
}