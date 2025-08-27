{ pkgs, ... }:

{
  imports = [ ./xserver.nix ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Cursor theme
  environment.systemPackages = with pkgs; [ bibata-cursors ];
}