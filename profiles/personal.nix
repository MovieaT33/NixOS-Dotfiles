{ stateVersion, home-manager, ... }:

{
  imports = [
    # Base system configuration
    ./system.nix

    # WM/DE configurations
    ../modules/app/config/sddm.nix
    ../modules/app/config/hyprland.nix
  ];

  # Personal application profiles
  home-manager.users."mvt33" = import ../modules/app/profiles/dev.nix;
  home-manager.users."mvt33" = import ../modules/app/profiles/fun.nix;
  home-manager.users."mvt33" = import ../modules/app/profiles/security.nix;
  home-manager.users."mvt33" = import ../modules/app/profiles/system.nix;
}