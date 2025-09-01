{ home-manager, stateVersion, pkgs, ... }:

let
  modulesDir  = builtins.toPath ./modules;
  securityDir = builtins.toPath ./security;
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

    # Security
    "${securityDir}/doas.nix"

    # Boot
    ./boot.nix
    ./bootloader.nix
    ./hardware.nix
    ./vm.nix
  ];
}