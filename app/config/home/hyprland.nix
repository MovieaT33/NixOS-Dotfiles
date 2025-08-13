{ config, ... }:

{
  imports = [
    ./kitty.nix
  ];

  home.file.".config/hypr/hyprland.conf".source = ../dotfiles/hyprland.conf;
}