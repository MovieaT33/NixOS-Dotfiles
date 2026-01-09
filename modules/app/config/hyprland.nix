{ pkgs, home-manager, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Cursor theme
  environment.systemPackages = with pkgs; [ bibata-cursors ];
  
  home-manager.users."mvt33" = import ./home-modules/hyprland/hyprland.nix;

  # TODO: Use modern app for "Application Not Responding" error.
  # TODO: Notification app.
}