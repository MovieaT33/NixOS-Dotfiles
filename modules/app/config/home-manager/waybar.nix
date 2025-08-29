{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ waybar ];
    file.".config/waybar" = {
      source = ../dotfiles/waybar;
      recursive = true;
    };
  };
}