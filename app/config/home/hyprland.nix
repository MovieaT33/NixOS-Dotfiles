{ config, ... }:

{
  imports = [
    ./kitty.nix
    ./wofi.nix
  ];

  home.file.".config/hypr/hyprland.conf".source = ../dotfiles/hypr/hyprland.conf;
}