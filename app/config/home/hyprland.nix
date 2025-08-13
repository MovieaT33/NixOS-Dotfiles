{ config, ... }:

{
  imports = [
    ./kitty.nix
  ];

  home.packages = with pkgs; [ hyprland ];

  wayland.windowManager.hyprland.enable = true;
}