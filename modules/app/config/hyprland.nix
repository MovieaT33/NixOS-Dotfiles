{ pkgs, home-manager, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  home-manager.users."mvt33" = import ./home-modules/hyprland/hyprland.nix;

  # TODO: Notification app.
}