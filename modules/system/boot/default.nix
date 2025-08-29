{ ... }:

{
  imports = [
    # Modules
    ./network.nix
    ./nix.nix
    ./system.nix
    ./users.nix

    # Security
    ./security/doas.nix

    # Boot
    ./boot.nix
    ./bootloader.nix
    ./hardware.nix
    ./vm.nix
  ];
}