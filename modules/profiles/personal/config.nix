{ ... }:

{
  imports = [
    ../base.nix
    ../../app/config/sddm.nix
    ../../app/config/hyprland.nix
    ../../app/profiles/dev.nix
  ];

  home-manager.users.mvt33 = import ./home.nix;
}