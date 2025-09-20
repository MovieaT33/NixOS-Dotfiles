{ stateVersion, ... }:

{
  imports = [
    ./system.nix

    # Application profiles
    ../modules/app/profiles/dev.nix
    # ../../modules/app/profiles/fun.nix

    # WM/DE configurations
    ../modules/app/config/sddm.nix
    ../modules/app/config/hyprland.nix
  ];
}