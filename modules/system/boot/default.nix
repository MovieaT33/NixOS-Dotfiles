{ home-manager, stateVersion, pkgs, ... }:

let
  bootDir     = builtins.toPath ./boot;
  modulesDir  = builtins.toPath ./modules;
  securityDir = builtins.toPath ./security;
in
{
  # Home manager users
  home-manager.users = {
    "mvt33" = {
      home = {
        inherit stateVersion;
        username = "mvt33";
        homeDirectory = "/home/mvt33";
      };
    };

    "root" = {
      home = {
        inherit stateVersion;
        username = "root";
        homeDirectory = "/home/root";
      };
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