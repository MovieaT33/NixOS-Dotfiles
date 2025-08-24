{ config, ... }:

{
  imports = [
    ./hyprpaper.nix
    ./waybar.nix
    ./wofi.nix

    ./kitty.nix
  ];

  home.file.".config/hypr/hyprland.conf".source = ../dotfiles/hypr/hyprland.conf;
}