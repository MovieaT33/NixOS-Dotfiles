{ stateVersion, ... }:

{
  imports = [
    ../system.nix

    ../../app/profiles/dev.nix
    # ../../app/profiles/fun.nix

    ../../app/config/sddm.nix
    ../../app/config/hyprland.nix
  ];

  home-manager.users.mvt33 = import ./home.nix
}