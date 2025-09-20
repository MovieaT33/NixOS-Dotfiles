{ ... }:

{
  imports = [
    ./boot/default.nix
    ./modules/default.nix
    ./security/default.nix

    ./apps.nix
  ];
}