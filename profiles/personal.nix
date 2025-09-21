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
  home-manager.users."mvt33" = { ... }: {
    imports = [
      ../modules/app/profiles/dev.nix
      ../modules/app/profiles/fun.nix
      ../modules/app/profiles/security.nix
      ../modules/app/profiles/system.nix
    ];
  };
}