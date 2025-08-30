{ home-manager, stateVersion, pkgs, ... }:

let
  modulesDir = builtins.toPath ./modules;
in
{
  home-manager.users.mvt33 = import "${modulesDir}/home.nix" {
    inherit stateVersion pkgs;
  };

  imports = [
    # Modules
    "${modulesDir}/network.nix"
    "${modulesDir}/nix.nix"
    "${modulesDir}/system.nix"
    "${modulesDir}/users.nix"

    # Boot
    ./boot.nix
    ./bootloader.nix
    ./hardware.nix
    ./vm.nix
  ];
}