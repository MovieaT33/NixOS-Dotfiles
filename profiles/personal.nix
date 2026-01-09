{ stateVersion, home, home-manager, ... }:

let
  modulesDir = builtins.toPath ../modules;
in
{
  imports = [
    # Base system configuration
    ./system.nix

    # WM/DE configurations
    "${modulesDir}/app/config/docker.nix"
    "${modulesDir}/app/config/hyprland.nix"
    "${modulesDir}/app/config/plasma.nix"
    "${modulesDir}/app/config/sddm.nix"
  ];

  # Personal application profiles
  home-manager.users."mvt33" = { ... }: {
    imports = [
      "${modulesDir}/app/profiles/dev.nix"
      "${modulesDir}/app/profiles/fun.nix"
      "${modulesDir}/app/profiles/security.nix"
      "${modulesDir}/app/profiles/system.nix"

      "${modulesDir}/app/config/home-modules/shells/fish.nix"
      "${modulesDir}/app/config/home-modules/shells/nushell.nix"
    ];
  };
}