{ config, ... }:

{
  imports = [
    ./hyprpaper.nix
    ./waybar.nix
    ./wofi.nix

    ./kitty.nix
  ];

  home = {
    file.".config/hypr" = {
      source = ../dotfiles/hypr;
      recursive = true;
    };
  };
}