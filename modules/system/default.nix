{ ... }:

{
  imports = [
    # Module configurations
    ./boot/default.nix
    ./modules/default.nix
    ./security/default.nix

    # Applications
    ./apps.nix
  ];
}