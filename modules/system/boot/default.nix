{ home-manager, stateVersion, ... }:

{
  home-manager.users.mvt33 = import ./modules/home-manager.nix {
    inherit stateVersion;
  };

  imports = [
    # Modules
    ./modules/network.nix
    ./modules/nix.nix
    ./modules/system.nix
    ./modules/users.nix

    # Security
    ./security/doas.nix

    # Boot
    ./boot.nix
    ./bootloader.nix
    ./hardware.nix
    ./vm.nix
  ];
}