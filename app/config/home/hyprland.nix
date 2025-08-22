{ config, ... }:

{
  imports = [
    ./hyprpaper.nix
    ./waybar.nix
    ./wofi.nix

    ./kitty.nix
  ];

  home.file.".config/hypr/hyprland.conf".source = ../dotfiles/.config/hypr/hyprland.conf;
}