{ stateVersion, ... }:

{
  imports = [
    ../system.nix

    ../../modules/app/profiles/dev.nix
    # ../../modules/app/profiles/fun.nix

    ../../modules/app/config/sddm.nix
    ../../modules/app/config/hyprland.nix
  ];
}