{ config, pkgs, ... }:

{
  imports = [
    ../base/configuration.nix
    ../../app/profiles/system.nix
    ../../app/profiles/dev.nix
  ];

  # SDDM
  # services.xserver.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.defaultSession = "hyprland";

  # Hyprland
  # programs.hyprland.enable = true;

  # Xwayland
  # programs.hyprland.xwayland.enable = true;
}