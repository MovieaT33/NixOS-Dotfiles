{ config, pkgs, ... }:

{
  imports = [
    ../base/configuration.nix
    ../../app/system.nix
    ../../app/security.nix
    ../../app/dev.nix
    ../../app/fun.nix
  ];

  # SDDM, Hyprland and Wayland
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  # Users
  programs.zsh.enable = true;

  users.users.mvt33 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    # General
    inetutils
    # mprocs

    # Hyprland
    kitty
  ];
}