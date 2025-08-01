{ config, lib, pkgs, ... }:

{
  imports = [
    ../base/configuration.nix
    ../system/configuration.nix
    ../development/configuration.nix
    ../security/configuration.nix
    ../fun/configuration.nix
  ];

  # SDDM, Hyprland and Wayland
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  # Users
  users.users.mvt33 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    # General
    atuin
    bat
    eza
    fd
    lf
    lolcat
    # mprocs
    tldr
    tig
    tmux
    # tokei
    tor
    tree
    wordgrinder
    yazi
    zoxide

    # Hyprland
    kitty
  ];
}