{ config, ... }:

{
  imports = [
    ./kitty.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}