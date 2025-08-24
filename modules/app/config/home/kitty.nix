{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ kitty ];
    file.".config/kitty" = {
      source = ../dotfiles/kitty;
      recursive = true;
    };
  };
}