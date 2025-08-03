{ config, pkgs, ... }:

{
  imports = [
    ../base/configuration.nix
    ../../app/all.nix
  ];

  # SDDM
  # services.xserver.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.defaultSession = "hyprland";

  # Hyprland
  # programs.hyprland.enable = true;

  # Xwayland
  # programs.hyprland.xwayland.enable = true;

  # Users
  programs.zsh.enable = true;
  users.defaultUserShell = "${pkgs.zsh}/bin/zsh";;

  users.users.mvt33 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
  };
}