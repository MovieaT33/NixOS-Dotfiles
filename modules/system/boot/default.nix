{ ... }:

{
  imports = [
    ./boot.nix
    ./bootloader.nix
    ./hardware.nix
    ./network.nix
    ./system.nix
    ./users.nix
    ./vm.nix
  ];
}