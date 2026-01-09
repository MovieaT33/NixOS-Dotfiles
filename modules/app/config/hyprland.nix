{ home, pkgs, home-manager, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Cursor theme
  home.packages = with pkgs; [
    bibata-cursors
    wl-clipboard
  ];
  
  home-manager.users."mvt33" = import ./home-modules/hyprland/hyprland.nix;

  # TODO: Notification app.
}