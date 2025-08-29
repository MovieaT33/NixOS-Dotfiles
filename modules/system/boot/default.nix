{ home-manager, ... }:

{
  imports = [
    # Modules
    home-manager.users.mvt33 = import ./home-manager.nix
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