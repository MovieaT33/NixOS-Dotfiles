{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.sddm = {
    enable = true;
    wayland.enable = true;
  };
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}