{ home-manager, stateVersion, pkgs, ... }:

let
  bootDir     = builtins.toPath ./boot;
  modulesDir  = builtins.toPath ./modules;
  securityDir = builtins.toPath ./security;
in
{
  # Home manager users
  home-manager.users = {
    "mvt33" = import "${modulesDir}/home.nix" {
      inherit stateVersion pkgs;
    };

    "root" = import "${modulesDir}/home.nix" {
      inherit stateVersion pkgs;
    };
  };

  imports = [
    # Boot
    "${bootDir}/bootloader.nix"
    "${bootDir}/hardware.nix"
    "${bootDir}/initrd.nix"

    # Modules
    "${modulesDir}/network.nix"
    "${modulesDir}/nix.nix"
    "${modulesDir}/system.nix"
    "${modulesDir}/users.nix"

    # Security
    "${securityDir}/doas.nix"
  ];
}