{ ... }:

{
  imports = [ ./xserver.nix ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}